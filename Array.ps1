# https://ss64.com/ps/syntax-arrays.html
# Using the array cast syntax @(...) allows anything between the parenthesis to be treated as an array, it could be a single element, 
#the output from other commands/expressions, they will always be treated as an array.
# PowerShell is not case-sensitive so $myArray is treated the same as $Myarray
#Create an empty array:
$myArray = @()
# how to write array
$myarray = 10,"hello",15,"hi"
$myarray1 = (64,"Hello",3.5,"World")
$myarray2 = @(64,"Hello1",3.5,"World1")
# To distribute the values back into individual variables:
$var1,$var2,$var3,$var4 = $myArray
# or
($v1,$var2,$vr3,$va4,$var5) = $myArray
# Create an array containing several numeric (int) values:
$myArray = 1,2,3,4,5,6,7
#or using the range operator (..):
$myArray = (1..7)
#or strongly typed:
[int[]]$myArray = 12,64,8,64,12
# Create a Multi-dimensional array:

$myMultiArray = @(
             (1,2,3),
             (40,50,60)
   )
# Add values to an Array.
# This is done using the += operator
$Array =@(10,11,12,13,14,15,"hello","hi","India")
$Array += "goa"
$Array
# or 
# A faster alternative to use a .Net ArrayList (but this will remove the old array contain)
$Array = new-object System.Collections.ArrayList
$Array.Add("maharashtra") > $null
# Retrieve items from an Array
# Return all the elements in an array:
$myArray
# Return the first element in an array:
$myArray[0]
#Return the 5th element through to the 10th element in an array:
$myArray = @(1..10)
$myArray[4..9]
# Return the last element in an array
$myArray[-1]
#Return the first element from the first row in a multi-dimensional array:
$myMultiArray = @(
             (1,2,3),
             (40,50,60)
   )
$myMultiArray[1][2]
# You can also combine named elements with a range, separating them with a +
#so $myArray[1,2+4..9] will return the elements at indices 1 and 2 and then 4 through 9 inclusive
$myArray = @(1..10)
$myArray[1,2+6..9]
# Return the length of an array (how many items are in the array)
$myArray.length
# Loop through the elements in an array:
foreach ($element in $myArray) {$element}
# In PowerShell 4.0+ arrays have the methods .Where() and .Foreach()
# a faster alternative to a traditional pipeline at the expense of a higher memory consumption:
@(Get-Service).Where({$_.Status -eq 'stopped'})
#or omitting the parenthesis: 
@(Get-Service).Where{$_.Status -eq 'stopped'}
# Comparisons -eq - gt -lt etc
$a = 1,2,3,2
$a -eq 2
$a -lt 2
# Care must be taken with comparing NULLs, because this is a filter you must place the $null on the left side of the comparison.
$a -eq $null # fails returns $null
$null -eq $a # works: returns $false
# Multi-dimensional arrays
$MultiArray = @(
             ("cats","dogs","ravens"),
             (40,50,60)
        )
$MultiArray[0][2]
# Data Types
# When you create an array without specifying a datatype, PowerShell will create the array as an object array.
#To determine the data type of an array:
$myArray1.gettype()
# To create a strongly typed array, that can only contain values of one particular type, cast the variable as string[], long[], bool[], int32[] or any other valid data type. 
# To cast an array, place the array type enclosed in square brackets before the variable name. 
# e.g.
# if you add any other data type it will give error
[int32[]]$stronglytyped = @(64,12,24,5000)

[int32[][]]$multi = @(
(64, 12, 24),
(65, 14, 48)
)

##########********* If you pipe an array to Get-Member, it will display information about the objects in the array. 
###########If you use Get-Member -InputObject, that will display information about the array itself:
$myArray2 = @(1..10,"india")
# this will display the data type of object in the array
$myArray2 | GM
# this will display the data type of array
get-member -inputobject $myArray2
# Edit Array values
# To change values in an array after it has been created, use the assignment operator (=) to specify a new value.
$myArray2 = @(1..10)
$myArray2[4] = 64
$myArray2
#Alternatively use the SetValue method:
$myArray.SetValue(64,4)
$myMultiArray[2][4] = 128
# Add one array to another.
#This creates a new array containing all the values from the first two arrays:
$march = @(2, 3, 4, 5, 6)
$april = @(7, 8, 9, 10, 11, 12)
$all = $march + $april
# Delete Elements from an Array
#This has to be done by creating a new array based on the initial array minus the items that you don't want:
$demo = @(2, 4, 6, 7)
$demo
$final = $demo | Where-Object { ($_ -ne 7) }
#For large arrays it is much faster to step through the array with Foreach - example: removing empty elements

#Delete an Array (by deleting the array variable)
Remove-Item variable:monthly_sales
