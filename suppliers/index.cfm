<cfset main_dsn = "AdventureWorks">

<cfinclude template="/common/dsp_header.cfm" >
<cfif isDefined("fuseaction") AND fuseaction EQ "ViewSuppliers">
    <!--- we are running the qry file to get suppliers records --->
    <cfinclude template="qry_suppliers.cfm">
    <!--- according to the showSuppliers variable value we will show all records or only a single record in this page --->
    <cfinclude template="dsp_suppliers_view.cfm">

<cfelseif isDefined("fuseaction") AND fuseaction EQ "AddNewSupplier">
    <!--- we might use this for getting some of the dropdown values --->
    <cfinclude template="qry_suppliers.cfm">
    <!--- displaying a new supplier form page --->
    <cfinclude template="dsp_suppliers_new.cfm">

<cfelseif isDefined("fuseaction") AND fuseaction EQ "DeleteSupplier">
    <!--- deleting a supplier  --->
    <cfinclude template="act_suppliers_delete.cfm">
    <!--- after deleting the record we are running the ViewSuppliers fuseaction again to see the updated list of suppliers --->
    <script>
         document.location.replace('/suppliers/index.cfm?fuseaction=ViewSuppliers&showSuppliers=all')
    </script>

<cfelseif isDefined("fuseaction") AND fuseaction EQ "EditSupplier">
    <!--- to edit a single suppliers record we are collecting the info by their id in the qry --->
    <cfinclude template="qry_suppliers.cfm">
    <!--- will display that suppliers information with a new editable form --->
    <cfinclude template="dsp_suppliers_edit.cfm">

<cfelseif isDefined("fuseaction") AND fuseaction EQ "SaveSupplier">
    <!--- after adding or editing a supplier when we click on the submit button we will run the act file to update or to add the record --->
    <cfinclude template="act_suppliers_save.cfm">
    <!--- after updating or adding the record we will display that single new or updated record --->
    <cflocation url="index.cfm?fuseaction=ViewSuppliers&showSuppliers=single&SupplierID=#SupplierID#" />

     <!--- TODO: uncomment the codes after adding the queries and getting the variable from above --->
    <!--- <cfoutput>
        <script>
            document.location.replace('/suppliers/index.cfm?fuseaction=ViewSuppliers&showSuppliers=single&SupplierID=#SupplierID#')
       </script>
    </cfoutput> --->
<cfelseif isDefined("fuseaction") AND fuseaction EQ "FilterSuppliers">
    <!--- display suppliers according Alphabetical order and country --->
    <cfinclude template="qry_suppliers.cfm">
    <cfinclude template="dsp_suppliers_view.cfm">
</cfif>

<cfinclude template="/common/dsp_footer.cfm" >