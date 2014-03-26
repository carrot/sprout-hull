define [], ->
  hull:
    appId: <%= Hull_App_Id %>
    orgUrl: <%= Hull_Org_Url %>
  <%if (include_fb) {%>
  fb:
    app_id: "<FB_App_Id>"
  <%}%>
