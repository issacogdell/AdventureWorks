<div class="container">
    <div class="border border-secondary text-center rounded p-3">
        <h1 class="title mb-0 fw-bold">
            <cfif isDefined("showSuppliers") AND showSuppliers EQ "all">
                Suppliers
            <cfelse>
                <cfoutput query="getSingleSuppliersRecord">
                    Supplier No. #SupplierID#
                </cfoutput>
            </cfif>
        </h1>
    </div>
    <div class="my-4 text-end">
        <a href="index.cfm?fuseaction=AddNewSupplier" class="btn btn-primary">Add New Supplier</a>
    </div>
    <cfif isDefined("showSuppliers") AND showSuppliers EQ "all">
        <div>
            <form action="index.cfm" method="POST" name="FilterSuppliersForm" class="row mx-0 mb-4 gap-3">
                <h4 class="p-0 fw-bold w-auto my-auto">Filter:</h4>
                <input type="hidden" name="showSuppliers" value="all">
                <input type="hidden" name="fuseaction" value="FilterSuppliers">
                <cfoutput>
                    <input class="form-control w-auto" size="1" name="SelectedLetter" placeholder="A-Z" maxlength="1" title="First character of the Suppliers last name (A-Z)" pattern="[A-Za-z]{1}" <cfif isDefined("SelectedLetter") AND SelectedLetter NEQ "">value="#SelectedLetter#"<cfelse>value="A"</cfif> style="text-transform:uppercase" required>
                </cfoutput>
                <select class="form-select w-auto" name="SelectedCountry">
                    <cfoutput query="getAllCountryCodes">
                        <option <cfif ( NOT isDefined("SelectedCountry") AND CountryCode EQ "US" ) OR ( isDefined("SelectedCountry") AND SelectedCountry EQ CountryCode) >selected</cfif> value="#CountryCode#">#CountryName#</option>
                    </cfoutput>
                </select>
                <button type="submit" class="btn btn-primary w-auto">Go</button>
            </form>
        </div>
        <div class="table-responsive rounded">
            <table class="table border">
                <thead class="table-custom">
                    <tr>
                        <th nowrap>First Name</th>
                        <th nowrap>Last Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Actions</th>
                    </tr>
                </thead> 
                <tbody>
                    <cfoutput query="getAllSuppliersRecords">
                        <tr>
                            <td>
                                #FirstName#
                            </td>
                            <td>
                                #LastName#
                            </td>
                            <td>
                                #PhoneNumber#
                            </td>
                            <td>
                                #EmailAddress#
                            </td>
                            <td>
                                #City#, #StateCode#
                            </td>
                            <td class="flex">
                                <form action="index.cfm" method="POST" name="ViewSupplierForm_#SupplierID#" class="d-inline" title="See More">
                                    <input type="hidden" name="fuseaction" value="ViewSuppliers">
                                    <input type="hidden" name="SupplierID" value="#SupplierID#">
                                    <input type="hidden" name="showSuppliers" value="single">
                                    <input type="submit" class="d-none" id="viewSupplierSubmit_#SupplierID#">
                                    <label class="action-btn view-btn" for="viewSupplierSubmit_#SupplierID#">
                                        <svg class="inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                                        </svg>
                                    </label>
                                </form>

                                <form action="index.cfm" method="POST" name="EditSupplierForm_#SupplierID#" class="d-inline" title="Edit Supplier">
                                    <input type="hidden" name="fuseaction" value="EditSupplier">
                                    <input type="hidden" name="SupplierID" value="#SupplierID#">
                                    <input type="submit" class="d-none" id="editSupplierSubmit_#SupplierID#">
                                    <label class="action-btn edit-btn" for="editSupplierSubmit_#SupplierID#">
                                        <svg class="inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                        </svg>
                                    </label>
                                </form>
                                
                                <!--- Commented the delete function --->
                                <!--- <form action="index.cfm" method="POST" name="DeleteSupplierForm_#SupplierID#" class="d-inline" id="DeleteSupplierForm_#SupplierID#">
                                    <input type="hidden" name="fuseaction" value="DeleteSupplier">
                                    <input type="hidden" name="SupplierID" value="#SupplierID#">
                                    <label class="action-btn delete-btn" id="delete-btn_#SupplierID#">
                                        <svg class="inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                        </svg>
                                    </label>
                                </form> --->
                                <!--- <cfoutput> --->
                                    <!--- <script>
                                        const deleteBtn_#SupplierID# = document.getElementById("delete-btn_#SupplierID#");
                                        deleteBtn_#SupplierID#.onclick = () => {
                                            Swal.fire({
                                            position: 'center',
                                            allowEscapeKey: false,
                                            allowOutsideClick: false,
                                            icon: 'warning',
                                            title: '<span style="color:##000">Are you sure you want to delete this supplier?</span>',
                                            showConfirmButton: true,
                                            confirmButtonColor: "##ff6358",
                                            confirmButtonText: 'Confirm',
                                            focusConfirm: false,
                                            showCancelButton: true,
                                            cancelButtonText: 'Cancel',
                                            focusCancel: true,
                                            }).then((result) => {
                                                if (result.isConfirmed){
                                                    document.getElementById("DeleteSupplierForm_#SupplierID#").submit();
                                                } else if (result.isDismissed){
                                                    Swal.close();
                                                }
                                            })
                                        }
                                    </script> --->
                                <!--- </cfoutput> --->
                            </td>
                        </tr>
                    </cfoutput>
                </tbody>
            </table>
        </div>
    <cfelse>
        <cfoutput query="getSingleSuppliersRecord">
            <div class="flex text-end">
                <form action="index.cfm" method="POST" name="EditSupplierForm_#SupplierID#" class="d-inline" title="Edit Supplier">
                    <input type="hidden" name="fuseaction" value="EditSupplier">
                    <input type="hidden" name="SupplierID" value="#SupplierID#">
                    <input type="submit" class="d-none" id="editSupplierSubmit_#SupplierID#">
                    <label class="action-btn edit-btn" for="editSupplierSubmit_#SupplierID#">
                        <svg class="inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                        </svg>
                    </label>
                </form>
                
                <!--- Commented the delete function --->
                <!--- <form action="index.cfm" method="POST" name="DeleteSupplierForm_#SupplierID#" class="d-inline" id="DeleteSupplierForm_#SupplierID#">
                    <input type="hidden" name="fuseaction" value="DeleteSupplier">
                    <input type="hidden" name="SupplierID" value="#SupplierID#">
                    <label class="action-btn delete-btn" id="delete-btn_#SupplierID#">
                        <svg class="inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                        </svg>
                    </label>
                </form> --->
                <!--- <cfoutput> --->
                    <!--- <script>
                        const deleteBtn_#SupplierID# = document.getElementById("delete-btn_#SupplierID#");
                        deleteBtn_#SupplierID#.onclick = () => {
                            Swal.fire({
                            position: 'center',
                            allowEscapeKey: false,
                            allowOutsideClick: false,
                            icon: 'warning',
                            title: '<span style="color:##000">Are you sure you want to delete this supplier?</span>',
                            showConfirmButton: true,
                            confirmButtonColor: "##ff6358",
                            confirmButtonText: 'Confirm',
                            focusConfirm: false,
                            showCancelButton: true,
                            cancelButtonText: 'Cancel',
                            focusCancel: true,
                            }).then((result) => {
                                if (result.isConfirmed){
                                    document.getElementById("DeleteSupplierForm_#SupplierID#").submit();
                                } else if (result.isDismissed){
                                    Swal.close();
                                }
                            })
                        }
                    </script> --->
                <!--- </cfoutput> --->
            </div>
            <div class="table-responsive rounded mt-4">
                <table class="table table-bordered">
                    <thead class="table-custom">
                        <tr>
                            <th>Title</th>
                            <th nowrap>First Name</th>
                            <th nowrap>Middle Name</th>
                            <th nowrap>Last Name</th>
                            <th>Suffix</th>
                        </tr>
                    </thead> 
                    <tbody>
                        <tr>
                            <td>
                                <cfif isDefined("Title") AND Title NEQ "">
                                    #Title#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("FirstName") AND FirstName NEQ "">
                                    #FirstName#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("MiddleName") AND MiddleName NEQ "">
                                    #MiddleName#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("LastName") AND LastName NEQ "">
                                    #LastName#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("Suffix") AND Suffix NEQ "">
                                    #Suffix#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table-responsive rounded mt-4">
                <table class="table table-bordered">
                    <thead class="table-custom">
                        <tr>
                            <th colspan="2">Phone</th>
                            <th>Email</th>
                        </tr>
                    </thead> 
                    <tbody>
                            <td>
                                <cfif isDefined("PhoneNumberType") AND PhoneNumberType NEQ "">
                                    #PhoneNumberType#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("PhoneNumber") AND PhoneNumber NEQ "">
                                    #PhoneNumber#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("EmailAddress") AND EmailAddress NEQ "">
                                    #EmailAddress#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table-responsive rounded mt-4">
                <table class="table table-bordered">
                    <thead class="table-custom">
                        <tr>
                            <th>Address Line 1</th>
                            <th>Address Line 2</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Postal Code</th>
                        </tr>
                    </thead> 
                    <tbody>
                        <tr>
                            <td>
                                <cfif isDefined("AddressLine1") AND AddressLine1 NEQ "">
                                    #AddressLine1#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("AddressLine2") AND AddressLine2 NEQ "">
                                    #AddressLine2#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("City") AND City NEQ "">
                                    #City#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("StateCode") AND StateCode NEQ "">
                                    #StateCode#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                            <td>
                                <cfif isDefined("PostalCode") AND PostalCode NEQ "">
                                    #PostalCode#
                                <cfelse>
                                    N/A
                                </cfif>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div>
                    <a href="/suppliers/index.cfm?fuseaction=ViewSuppliers&showSuppliers=all" class="btn btn-secondary">Go Back</a>
                </div>
            </div>
        </cfoutput>
    </cfif>
</div>