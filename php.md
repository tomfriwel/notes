#### [Call to undefined function curl_init().? [duplicate]](https://stackoverflow.com/questions/6382539/call-to-undefined-function-curl-init)

```shell
$ apt-get update
$ sudo apt-get install php-curl
```

#### next month
```php
$date = date('Y-m-d', strtotime('+1 month', strtotime('2015-01-01')));
```

[How do I get next month date from today's date and insert it in my database?](https://stackoverflow.com/a/4319004/6279975)

### mongo

[MongoDB driver classes](https://www.php.net/manual/en/book.mongodb.php)

### password regex

```php
$password= $_POST['password'];
if (preg_match("#.*^(?=.{8,20})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).*$#", $password)){
    echo "Your password is good.";
} else {
    echo "Your password is bad.";
}
```
- [Password Validation with PHP and Regular Expressions](https://www.imtiazepu.com/password-validation/)