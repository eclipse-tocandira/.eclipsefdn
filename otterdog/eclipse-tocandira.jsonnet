local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('iot.tocandira', 'eclipse-tocandira') {
  settings+: {
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('Container-Watchdog') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "  This repository contains an application to control the internal configurations of other docker containers inside the same compose.",
      homepage: "",
      topics+: [
        "docker",
        "orchestrator",
        "pyhon3"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('Tocandira') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "A modern monitoring toolkit applied to Industry",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('Tocandira-Dashboard') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "A simple Grafana customization for Tocandira",
      has_wiki: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('Tocandira-api-gateway') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "A pré-configured version of Kong API Gateway",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('Tocandira-back') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Backend for Tocandira configuration",
      homepage: "",
      topics+: [
        "backend",
        "docker",
        "python3"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('Tocandira-front') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Web Frontend for Tocandira configuration",
      homepage: "",
      topics+: [
        "docker",
        "frontend",
        "react"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('Tocandira-opcua-gateway') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Makes the communication with the PLCs and build a test server and also the gateway to collect the data.",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('tocandira-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Project website",
      web_commit_signoff_required: false,
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}