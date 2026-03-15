package main

import (
	"crypto/rand"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"log"
	"os"

	"golang.org/x/crypto/nacl/box"
)

func readInput() (publicKey [32]byte, secrets map[string]string, err error) {
	var input map[string]string
	if err := json.NewDecoder(os.Stdin).Decode(&input); err != nil {
		return publicKey, nil, fmt.Errorf("failed to read input: %w", err)
	}

	key, ok := input["key"]
	if !ok || key == "" {
		return publicKey, nil, fmt.Errorf("missing required field: key")
	}

	file, ok := input["file"]
	if !ok || file == "" {
		return publicKey, nil, fmt.Errorf("missing required field: file")
	}

	raw, err := os.ReadFile(file)
	if err != nil {
		return publicKey, nil, fmt.Errorf("failed to read secrets file: %w", err)
	}

	if err := json.Unmarshal(raw, &secrets); err != nil {
		return publicKey, nil, fmt.Errorf("failed to parse secrets file: %w", err)
	}

	publicKeyBytes, err := base64.StdEncoding.DecodeString(key)
	if err != nil {
		return publicKey, nil, fmt.Errorf("failed to decode public key: %w", err)
	}

	copy(publicKey[:], publicKeyBytes)

	return publicKey, secrets, nil
}

func encryptSecrets(publicKey [32]byte, secrets map[string]string) (map[string]string, error) {
	output := make(map[string]string, len(secrets))
	for name, value := range secrets {
		encrypted, err := box.SealAnonymous(nil, []byte(value), &publicKey, rand.Reader)
		if err != nil {
			return nil, fmt.Errorf("failed to encrypt %q: %w", name, err)
		}
		output[name] = base64.StdEncoding.EncodeToString(encrypted)
	}
	return output, nil
}

func writeOutput(output map[string]string) error {
	if err := json.NewEncoder(os.Stdout).Encode(output); err != nil {
		return fmt.Errorf("failed to write output: %w", err)
	}
	return nil
}

func main() {
	publicKey, secrets, err := readInput()
	if err != nil {
		log.Fatal(err)
	}

	output, err := encryptSecrets(publicKey, secrets)
	if err != nil {
		log.Fatal(err)
	}

	if err := writeOutput(output); err != nil {
		log.Fatal(err)
	}
}
