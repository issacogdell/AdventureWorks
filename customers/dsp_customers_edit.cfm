<cfoutput query="getSingleCustomersRecord">
    <div class="container">
        <div class="border border-secondary text-center rounded p-3">
            <h1 class="title mb-0 fw-bold">Edit Customer No. #CustomerID#</h1>
        </div>
        <form action="index.cfm" method="POST" name="AddNewCustomerForm">
            <div class="table-responsive rounded mt-4">
                <table class="table table-bordered">
                    <thead class="table-custom">
                        <tr>
                            <th>Title</th>
                            <th nowrap>First Name*</th>
                            <th nowrap>Middle Name</th>
                            <th nowrap>Last Name*</th>
                            <th>Suffix</th>
                        </tr>
                    </thead> 
                    <tbody>
                        <tr>
                            <td>
                                <select name="Title" class="form-select">
                                    <option value="" <cfif isDefined("Title") AND Title EQ "">selected</cfif>>Select</option>
                                    <option value="Mr." <cfif isDefined("Title") AND Title EQ "Mr.">selected</cfif>>Mr.</option>
                                    <option value="Ms." <cfif isDefined("Title") AND Title EQ "Ms.">selected</cfif>>Ms.</option>
                                </select>
                            </td>
                            <td>
                                <input type="text" name="FirstName" class="form-control" <cfif isDefined("FirstName") AND FirstName NEQ "">value="#FirstName#"</cfif> placeholder="First Name" required>
                            </td>
                            <td>
                                <input type="text" name="MiddleName" class="form-control" <cfif isDefined("MiddleName") AND MiddleName NEQ "">value="#MiddleName#"</cfif> placeholder="Middle Name">
                            </td>
                            <td>
                                <input type="text" name="LastName" class="form-control" <cfif isDefined("LastName") AND LastName NEQ "">value="#LastName#"</cfif> placeholder="Last Name" required>
                            </td>
                            <td>
                                <input type="text" name="Suffix" class="form-control" <cfif isDefined("Suffix") AND Suffix NEQ "">value="#Suffix#"</cfif> placeholder="Suffix">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table-responsive rounded mt-4">
                <table class="table table-bordered">
                    <thead class="table-custom">
                        <tr>
                            <th colspan="2">Phone*</th>
                            <th>Email*</th>
                        </tr>
                    </thead> 
                    <tbody>
                        <tr>
                            <td>
                                <select name="PhoneNumbertype" class="form-select" required>
                                    <cfloop from="1" to="#getPhoneNumberTypes.recordcount#" index="i">
                                        <option value="#getPhoneNumberTypes.PhoneNumberTypeID[i]#" <cfif thisPhoneNumberTypeID EQ #getPhoneNumberTypes.PhoneNumberTypeID[i]#>selected</cfif>>#getPhoneNumberTypes.Name[i]#</option>
                                    </cfloop>
                                </select>
                            </td>
                            <td>
                                <input type="tel" name="PhoneNumber" class="form-control" <cfif isDefined("PhoneNumber") AND PhoneNumber NEQ "">value="#PhoneNumber#"</cfif> placeholder="Phone Number" required>
                            </td>
                            <td>
                                <input type="email" name="EmailAddress" class="form-control" <cfif isDefined("EmailAddress") AND EmailAddress NEQ "">value="#EmailAddress#"</cfif> placeholder="Email Address" required>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table-responsive rounded mt-4">
                <table class="table table-bordered">
                    <thead class="table-custom">
                        <tr>
                            <th>Address Line 1*</th>
                            <th>Address Line 2</th>
                            <th>City*</th>
                            <th>State*</th>
                            <th>Postal Code*</th>
                        </tr>
                    </thead> 
                    <tbody>
                        <tr>
                            <td>
                                <input type="address" name="AddressLine1" class="form-control" <cfif isDefined("AddressLine1") AND AddressLine1 NEQ "">value="#AddressLine1#"</cfif> placeholder="Address Line 1" required>
                            </td>
                            <td>
                                <input type="address" name="AddressLine2" class="form-control" <cfif isDefined("AddressLine2") AND AddressLine2 NEQ "">value="#AddressLine2#"</cfif>  placeholder="Address Line 2">
                            </td>
                            <td>
                                <!--- we can do a query to get all the cities available in the database and can show them in a dropdown --->
                                <input type="text" name="City" class="form-control" <cfif isDefined("City") AND City NEQ "">value="#City#"</cfif>  placeholder="City" required>
                            </td>
                            <td>
                                <!--- we can do a query to get all the states available in the database and can show them in a dropdown --->
                                <input type="text" name="StateCode" class="form-control" <cfif isDefined("StateCode") AND StateCode NEQ "">value="#StateCode#"</cfif> placeholder="State" required>
                            </td>
                            <td>
                                <input type="text" name="PostalCode" class="form-control" <cfif isDefined("PostalCode") AND PostalCode NEQ "">value="#PostalCode#"</cfif> placeholder="Postal Code" required>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div>
                    <input type="hidden" name="CustomerID" value="#CustomerID#">
                    <cfoutput>
                        <input type="hidden" name="previousFuseaction" value="#fuseaction#">
                    </cfoutput>
                    <input type="hidden" name="fuseaction" value="SaveCustomer">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <a href="/customers/index.cfm?fuseaction=ViewCustomers&showCustomers=all" class="btn btn-secondary ms-2">Go Back</a>
                </div>
            </div>
        </form>
    </div>
</cfoutput>