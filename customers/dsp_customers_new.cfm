<div class="container">
    <div class="border border-secondary text-center rounded p-3">
        <h1 class="title mb-0 fw-bold">Add New Customer</h1>
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
                                <option value="" selected>Select</option>
                                <option value="Mr.">Mr.</option>
                                <option value="Ms.">Ms.</option>
                            </select>
                        </td>
                        <td>
                            <input type="text" name="FirstName" class="form-control" placeholder="First Name" required>
                        </td>
                        <td>
                            <input type="text" name="MiddleName" class="form-control" placeholder="Middle Name">
                        </td>
                        <td>
                            <input type="text" name="LastName" class="form-control" placeholder="Last Name" required>
                        </td>
                        <td>
                            <input type="text" name="Suffix" class="form-control" placeholder="Suffix">
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
                            <select name="TelephoneNumberType" class="form-select" required>
                                <option value="" selected>Select</option>
                                <cfoutput query="getPhoneNumberTypes">
                                    <option value="#PhoneNumberTypeID#">#Name#</option>
                                </cfoutput>
                            </select>
                        </td>
                        <td>
                            <input type="tel" name="PhoneNumber" class="form-control" placeholder="Phone Number" required>
                        </td>
                        <td>
                            <input type="email" name="EmailAddress" class="form-control" placeholder="Email Address" required>
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
                            <input type="address" name="AddressLine1" class="form-control" placeholder="Address Line 1" required>
                        </td>
                        <td>
                            <input type="address" name="AddressLine2" class="form-control" placeholder="Address Line 2">
                        </td>
                        <td>
                            <!--- we can do a query to get all the cities available in the database and can show them in a dropdown --->
                            <input type="text" name="City" class="form-control" placeholder="City" required>
                        </td>
                        <td>
                            <!--- we can do a query to get all the states available in the database and can show them in a dropdown --->
                            <input type="text" name="StateCode" class="form-control" placeholder="State" required>
                        </td>
                        <td>
                            <input type="text" name="PostalCode" class="form-control" placeholder="Postal Code" required>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div>
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