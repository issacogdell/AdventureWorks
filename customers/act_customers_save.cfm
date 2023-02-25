<cfif isDefined("previousFuseaction") AND previousFuseaction EQ "AddNewCustomer">
    <!--- this will run when the previous fuseaction is AddNewCustomer --->
    <cfinclude template="act_customers_new.cfm">
<cfelse>
    <!--- this will run when the previous fuseaction is EditCustomer --->
    <cfinclude template="act_customers_edit.cfm">
</cfif>