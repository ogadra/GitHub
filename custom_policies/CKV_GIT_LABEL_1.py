"""Checkov custom check: ensure github_issue_labels color codes are lowercase hex."""

import re
from typing import Any

from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.common.bridgecrew.severities import Severities


class LabelColorLowercase(BaseResourceCheck):
    """Detect uppercase hex characters (A-F) in github_issue_labels color attributes."""

    def __init__(self) -> None:
        """Initialize the check with ID, supported resources, and severity."""
        name = "Ensure label color codes use lowercase hex characters"
        check_id = "CKV_GIT_LABEL_1"
        supported_resources = ["github_issue_labels"]
        categories = [CheckCategories.CONVENTION]
        super().__init__(name=name, id=check_id, categories=categories, supported_resources=supported_resources)
        self.severity = Severities["MEDIUM"]

    def scan_resource_conf(self, conf: dict[str, list[Any]]) -> CheckResult:
        """Check each label block for uppercase hex color codes.

        Appends a detail message per violating label, including the current
        value and the expected lowercase form.
        """
        labels = conf.get("label", [])
        if not isinstance(labels, list):
            labels = [labels]
        failed = False
        for label in labels:
            if not isinstance(label, dict):
                continue
            color_value = label.get("color", "")
            name_value = label.get("name", "")
            color = color_value[0] if isinstance(color_value, list) and color_value else color_value
            name = name_value[0] if isinstance(name_value, list) and name_value else name_value
            color_str = str(color)
            if re.search(r"[A-F]", color_str):
                self.details.append(f'Label "{name}" has uppercase color: "{color_str}" -> "{color_str.lower()}"')
                failed = True
        return CheckResult.FAILED if failed else CheckResult.PASSED


check = LabelColorLowercase()
