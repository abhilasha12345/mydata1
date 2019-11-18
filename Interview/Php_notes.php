43) What is PHP
Hypertext Preprocessor.
It is a server-side scripting language used to create dynamic web pages.
------------------------------------------------------------
44) Popular frameworks of PHP
CakePHP,Codeigniter,Laravel,Yii2,Symphony,Zend
---------------------------------------------------------
45) Popular CMS of PHP
wordpress,joomla,magento,drupal
---------------------------------------------------------
46) Which function can be used to exit from the script after displaying the error message?
You can use exit() or die() function to exit from the current script after displaying the error message.

Sample code:

if(!fopen('t.txt','r'))
exit(" Unable to open the file");

Sample code:

if(!mysqli_connect('localhost','user','password'))
die(" Unable to connect with the database");
------------------------------------------------------------------------------------------------------
48) Which function is used in PHP to check the data type of any variable?
gettype() function is used to check the data type of any variable.

Sample code:

echo gettype(true).''; //boolean
echo gettype(10).''; //integer
echo gettype('Web Programming').''; //string
echo gettype(null).''; //NULL

------------------------------------------------------------------------------------------------------
49) Explain type casting and type juggling.

The way by which PHP can assign a particular data type for any variable is called typecasting. The required type of variable is mentioned in the parenthesis before the variable.

Sample code:

$str = "10"; // $str is now string

$bool = (boolean) $str; // $bool is now boolean
PHP does not support data type for variable declaration. The type of the variable is changed automatically based on the assigned value and it is called type juggling.

Sample code:

$val = 5; // $val is now number
$val = "500" //$val is now string
---------------------------------------------------------------------------------------------------
50) What is the use of header function

header() is used to redirect from one page to another: header("Location: index.php");
header() is used to send an HTTP status code: header("HTTP/1.0 this Not Found");
header() is used to send a raw HTTP header: header('Content-Type: application/json');
------------------------------------------------------------------------------------------------------
Q #11) How can you increase the maximum execution time of a script in PHP?

You need to change the value of the max_execution_time directive in the php.ini file for increasing the maximum execution time.

For Example, if you want to set the max execution time for 120 seconds, then set the value as follows,

max_execution_time = 120

------------------------------------------------------------------------------------------------------
Q #12) What is meant by ‘passing the variable by value and reference' in PHP?

When the variable is passed as value then it is called pass variable by value.

Here, the main variable remains unchanged even when the passed variable changes.

Sample code:
function test($n) {
	$n=$n+10;

}
$m=5;
test($m);

echo $m;
When the variable is passed as a reference then it is called pass variable by reference. Here, both the main variable and the passed variable share the same memory location and & is used for reference.

So, if one variable changes then the other will also change.

Sample code:

function test(&$n) {
    $n=$n+10;

}

$m=5;

test($m);

echo $m;

Q #47) What is garbage collection?

Answer:

It is an automated feature of PHP.

When it runs, it removes all sessions data which are not accessed for a long time. It runs on /tmp directory which is the default session directory.

PHP directives which are used for garbage collection include:

session.gc_maxlifetime (default value, 1440)
session.gc_probability (default value, 1)
session.gc_divisor (default value, 100)
Q #48) Which library is used in PHP to do various types of Image work?

Answer:

Using GD library, various types of image work can be done in PHP. Image work includes rotating image, cropping an image, creating image thumbnail etc.

--------------------------------------------------------------------------------------------
Q #28) How can you declare a constant variable in PHP?

define() function is used to declare a constant variable in PHP. Constant variable declares without the $ symbol.

Sample code:

define("PI",3.14);
-------------------------------------------------------------------------------------------
Question 30. What are the difference between echo and print?

echo in PHP
echo is language constructs that display strings.
echo has a void return type.
echo can take multiple parameters separated by comma.
echo is slightly faster than print.

Print in PHP
print is language constructs that display strings.
print has a return value of 1 so it can be used in expressions.
print cannot take multiple parameters.
print is slower than echo.
-------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------
