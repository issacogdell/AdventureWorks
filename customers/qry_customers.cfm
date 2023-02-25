<cfif isDefined("fuseaction") AND fuseaction EQ "ViewCustomers">
    <cfif isDefined("showCustomers") AND showCustomers EQ "all">
        <!--- get all the customer records from the database by this query --->
        <cfquery name="getAllCustomersRecords" datasource="#main_dsn#">
            SELECT p.BusinessEntityID AS CustomerID, 
                Title, FirstName, LastName, MiddleName, Suffix, 
                AddressLine1, AddressLine2, City, PersonType,
                StateProvinceCode AS StateCode, PostalCode, 
                CountryRegionCode AS CountryCode,
                EmailAddress, PhoneNumber
            FROM Person.Person p
            RIGHT JOIN Person.EmailAddress pe ON p.BusinessEntityID =  pe.BusinessEntityID
            RIGHT JOIN Person.PersonPhone pp ON p.BusinessEntityID =  pp.BusinessEntityID 
            RIGHT JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
            RIGHT JOIN Person.Address pa ON bea.AddressID = pa.AddressID
            RIGHT JOIN Person.StateProvince sp ON pa.StateProvinceID = sp.StateProvinceID
            WHERE (p.BusinessEntityID IS NOT NULL AND PersonType = 'IN' AND CountryRegionCode = 'US')
            AND LastName LIKE 'A%'
            ORDER BY LastName ASC
        </cfquery>
        <cfquery name="getAllCountryCodes" datasource="#main_dsn#">
            SELECT CountryRegionCode AS CountryCode, Name AS CountryName, ModifiedDate AS CountryLastCHange
            FROM Person.CountryRegion
            ORDER BY Name ASC
        </cfquery>
    <cfelse>
        <!--- get single customer record by using the ID/CustomerID from the database by this query --->
        <cfquery name="getSingleCustomersRecord" datasource="#main_dsn#">
            SELECT p.BusinessEntityID AS CustomerID, 
                Title, FirstName, LastName, MiddleName, Suffix, 
                AddressLine1, AddressLine2, City, PersonType,
                StateProvinceCode AS StateCode, PostalCode, 
                CountryRegionCode AS CountryCode,
                EmailAddress, PhoneNumber, pnt.Name AS PhoneNumberType
            FROM Person.Person p
            RIGHT JOIN Person.EmailAddress pe ON p.BusinessEntityID =  pe.BusinessEntityID
            RIGHT JOIN Person.PersonPhone pp ON p.BusinessEntityID =  pp.BusinessEntityID 
            Right JOIN Person.PhoneNumberType pnt ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID
            RIGHT JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
            RIGHT JOIN Person.Address pa ON bea.AddressID = pa.AddressID
            RIGHT JOIN Person.StateProvince sp ON pa.StateProvinceID = sp.StateProvinceID
            WHERE p.BusinessEntityID = #CustomerID#
        </cfquery>
    </cfif>
<cfelseif isDefined("fuseaction") AND fuseaction EQ "AddNewCustomer">
    <!--- getting the telephone number types from the database --->
    <cfquery name="getPhoneNumberTypes" datasource="#main_dsn#">
        SELECT * FROM Person.PhoneNumberType
    </cfquery>

<cfelseif isDefined("fuseaction") AND fuseaction EQ "EditCustomer">
    <!--- get single customer record by using the ID/CustomerID from the database by this query --->
    <cfquery name="getSingleCustomersRecord" datasource="#main_dsn#">
        SELECT p.BusinessEntityID AS CustomerID, 
            Title, FirstName, LastName, MiddleName, Suffix, 
            AddressLine1, AddressLine2, City, PersonType,
            StateProvinceCode AS StateCode, PostalCode, 
            CountryRegionCode AS CountryCode,
            EmailAddress, PhoneNumber, pnt.Name AS PhoneNumberType, pnt.PhoneNumberTypeID AS PhoneNumberTypeID
        FROM Person.Person p
        RIGHT JOIN Person.EmailAddress pe ON p.BusinessEntityID =  pe.BusinessEntityID
        RIGHT JOIN Person.PersonPhone pp ON p.BusinessEntityID =  pp.BusinessEntityID 
        Right JOIN Person.PhoneNumberType pnt ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID
        RIGHT JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
        RIGHT JOIN Person.Address pa ON bea.AddressID = pa.AddressID
        RIGHT JOIN Person.StateProvince sp ON pa.StateProvinceID = sp.StateProvinceID
        WHERE p.BusinessEntityID = #CustomerID#
    </cfquery>
    <cfset thisPhoneNumberTypeID = #getSingleCustomersRecord.PhoneNumberTypeID#>
    <!--- getting the telephone number types from the database --->
    <cfquery name="getPhoneNumberTypes" datasource="#main_dsn#">
        SELECT * FROM Person.PhoneNumberType
    </cfquery>
<cfelseif isDefined("fuseaction") AND fuseaction EQ "FilterCustomers">
    <!--- getting the filtered customers from here --->
    <cfquery name="getAllCustomersRecords" datasource="#main_dsn#">
        SELECT p.BusinessEntityID AS CustomerID, 
            Title, FirstName, LastName, MiddleName, Suffix, 
            AddressLine1, AddressLine2, City, PersonType,
            StateProvinceCode AS StateCode, PostalCode, 
            CountryRegionCode AS CountryCode,
            EmailAddress, PhoneNumber
        FROM Person.Person p
        RIGHT JOIN Person.EmailAddress pe ON p.BusinessEntityID =  pe.BusinessEntityID
        RIGHT JOIN Person.PersonPhone pp ON p.BusinessEntityID =  pp.BusinessEntityID 
        RIGHT JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
        RIGHT JOIN Person.Address pa ON bea.AddressID = pa.AddressID
        RIGHT JOIN Person.StateProvince sp ON pa.StateProvinceID = sp.StateProvinceID
        WHERE (p.BusinessEntityID IS NOT NULL AND PersonType = 'IN' AND CountryRegionCode = '#SelectedCountry#')
        <cfif isDefined("SelectedLetter") AND SelectedLetter NEQ "">
            AND LastName LIKE '#SelectedLetter#%'
        </cfif>
        ORDER BY LastName ASC
    </cfquery>
     <cfquery name="getAllCountryCodes" datasource="#main_dsn#">
        SELECT CountryRegionCode AS CountryCode, Name AS CountryName, ModifiedDate AS CountryLastCHange
        FROM Person.CountryRegion
        ORDER BY Name ASC
    </cfquery>
</cfif>