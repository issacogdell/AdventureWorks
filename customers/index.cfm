<cfset main_dsn = "AdventureWorks">

<cfinclude template="/common/dsp_header.cfm" >
<cfif isDefined("fuseaction") AND fuseaction EQ "ViewCustomers">
    <!--- we are running the qry file to get customers records --->
    <cfinclude template="qry_customers.cfm">
    <!--- according to the showCustomers variable value we will show all records or only a single record in this page --->
    <cfinclude template="dsp_customers_view.cfm">

<cfelseif isDefined("fuseaction") AND fuseaction EQ "AddNewCustomer">
    <!--- we might use this for getting some of the dropdown values --->
    <cfinclude template="qry_customers.cfm">
    <!--- displaying a new customer form page --->
    <cfinclude template="dsp_customers_new.cfm">

<cfelseif isDefined("fuseaction") AND fuseaction EQ "DeleteCustomer">
    <!--- deleting a customer  --->
    <cfinclude template="act_customers_delete.cfm">
    <!--- after deleting the record we are running the ViewCustomers fuseaction again to see the updated list of customers --->
    <script>
         document.location.replace('/customers/index.cfm?fuseaction=ViewCustomers&showCustomers=all')
    </script>

<cfelseif isDefined("fuseaction") AND fuseaction EQ "EditCustomer">
    <!--- to edit a single customers record we are collecting the info by their id in the qry --->
    <cfinclude template="qry_customers.cfm">
    <!--- will display that customers information with a new editable form --->
    <cfinclude template="dsp_customers_edit.cfm">

<cfelseif isDefined("fuseaction") AND fuseaction EQ "SaveCustomer">
    <!--- after adding or editing a customer when we click on the submit button we will run the act file to update or to add the record --->
    <cfinclude template="act_customers_save.cfm">
    <!--- after updating or adding the record we will display that single new or updated record --->
    <cflocation url="index.cfm?fuseaction=ViewCustomers&showCustomers=single&CustomerID=#CustomerID#" />

     <!--- TODO: uncomment the codes after adding the queries and getting the variable from above --->
    <!--- <cfoutput>
        <script>
            document.location.replace('/customers/index.cfm?fuseaction=ViewCustomers&showCustomers=single&CustomerID=#CustomerID#')
       </script>
    </cfoutput> --->
<cfelseif isDefined("fuseaction") AND fuseaction EQ "FilterCustomers">
    <!--- display customers according Alphabetical order and country --->
    <cfinclude template="qry_customers.cfm">
    <cfinclude template="dsp_customers_view.cfm">
</cfif>

<cfinclude template="/common/dsp_footer.cfm" >