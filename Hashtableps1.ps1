# https://ss64.com/ps/syntax-hash-tables.html
$stuff = @{date=Get-Date ; service=get-service}
$stuff.service
$p1 = $p1 + @{(Get-Service WinRM) = ((Get-Service WinRM).Status)}
#define hash table
$class = @{"mansi"="14";"siddhesh"="MBA";"abhi"="MS"}
$class.Keys
$class.Values
$class.Count
$class.abhi
#add in hashtable
$class.Add("prathmesh","15")
$class
# Edit items in a Hash Table
$class.set_item("prathmesh","10")
$class.set_item("PRATHMESH","12")
#other hash table
$usa_states=@{ CA="California";
  "NY" = "New York";
  "IL" = "Illinois";
  "NH" = "New Hampshire"}

# Combine Hash Tables
$adding = $class+$usa_states

#Remove items from a Hash Table
$class.Remove("prathmesh")
$class
#Searching for items
$class.ContainsKey("ABHi")
$class.ContainsValue("MS") ### value are k sensative
# GetEnumerator
#(A hash table is a single PowerShell object, to sort, filter or work with the
#pipeline you can unwrap this object into it’s individual elements with the GetEnumerator() method.)
$class.GetEnumerator() | Sort-Object Name
#When unwrapped with GetEnumerator, the hash table returns a collection of (DictionaryEntry) objects, so they must be processed by cmdlets that can accept a collection,
#or alternatively pass the objects individually via ForEach.

# eg $hashtable.GetEnumerator() | ForEach-Object { … } 
# or
# eg ForEach($item in $hashtable.GetEnumerator()) {Echo $item … }
# eg ForEach($item in $hashtable.KEYS.GetEnumerator()) {Echo $item … }

foreach($item in $class.GetEnumerator()){echo $item}
foreach($item in $class.keys.GetEnumerator()){echo $item}

# Using @ as a SPLAT operator (did not under stood need to check)
CD D:\RND
$stuff = @{path = "c:\demo"; Recurse= $true}
$folder = @{path = "D:\RND" ; Recurse=Get-Date}
$FOLDER

# Store an Array inside a Hash table
$industory = @{customer="IBM"; array = 10,45,35}
$industory.array
$industory.array.Length
$industory.array.Count


# ordered the hashtable
$class1= @{"mansi"="14";"siddhesh"="MBA";"abhi"="MS"}
$class1
$class1= [ordered]@{"mansi"="14";"siddhesh"="MBA";"abhi"="MS"}
$class1
