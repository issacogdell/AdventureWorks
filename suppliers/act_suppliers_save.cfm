<cfif isDefined("previousFuseaction") AND previousFuseaction EQ "AddNewSupplier">
    <!--- this will run when the previous fuseaction is AddNewSupplier --->
    <cfinclude template="act_suppliers_new.cfm">
<cfelse>
    <!--- this will run when the previous fuseaction is EditSupplier --->
    <cfinclude template="act_suppliers_edit.cfm">
</cfif>