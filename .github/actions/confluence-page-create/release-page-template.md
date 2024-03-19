# ✨ Summary

- Release: [[JIRA_VERSION_LINK]]

# ㎝ Change Management



# 📋 Release Notes

## Example Jira Issues Macro

```xml
<ac:structured-macro ac:name=\"jira\" ac:schema-version=\"1\" ac:macro-id=\"f670ec81-1158-4270-916c-c2b98bda8861\"><ac:parameter ac:name=\"server\">TKTS JIRA</ac:parameter><ac:parameter ac:name=\"columnIds\">customfield_31283,summary,status,issuekey</ac:parameter><ac:parameter ac:name=\"columns\">Target end,summary,status,key</ac:parameter><ac:parameter ac:name=\"maximumIssues\">20</ac:parameter><ac:parameter ac:name=\"jqlQuery\">fixVersion = DG-R-24.03.19.0</ac:parameter><ac:parameter ac:name=\"serverId\">d6fdb7ba-e355-36d3-a87b-4f443786a39f</ac:parameter></ac:structured-macro>
```

---

{jiraissues:anonymous=true|url=https://tkts.comcast.net/issues/?filter=fixVersion=RLM-R-24.03.22}

[Documentation for Jira Issues Macro](https://confluence.atlassian.com/doc/jira-issues-macro-139380.html)

---

[more documentation on including via XML in JSON payload](https://community.atlassian.com/t5/Confluence-questions/Is-it-possible-to-add-Jira-Issue-macro-into-Confluence-page-via/qaq-p/1767996)

```xml
<ac:structured-macro ac:name="jiraissues">
<ac:parameter ac:name="anonymous">true</ac:parameter>
<ac:parameter ac:name="columns">type;key;summary</ac:parameter>
<ac:parameter ac:name="url">
<ri:url ri:value="http://jira.atlassian.com/sr/jira.issueviews:searchrequest-xml/temp/SearchRequest.xml?jqlQuery=project+%3D+CONF+AND+%28summary+%7E+jiraissues+OR+description+%7E+jiraissues+OR+comment+%7E+jiraissues%29&amp;tempMax=10"/>
</ac:parameter>
</ac:structured-macro>
```

# 💥 Cross-Team Impacts



# 📦 Artifcats, Builds, and Configuration



## This Release



## Last Release

- link to the previous release page (possibly automated)

# ⏱️ Release Schedule



# ⎌ Rollback Steps



# 🔬 Monitoring & Dashboards



# ℹ Contacts & Oncall

