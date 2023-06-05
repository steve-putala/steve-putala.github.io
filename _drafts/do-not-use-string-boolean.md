---
published: false
resources:
  - https://www.php.net/manual/en/function.filter-var.php
  - https://www.php.net/manual/en/filter.filters.validate.php
---

Please when checking the truthiness of a variable from outside sources (API, get/post, etc.) use a php filter to check it since the source may change its format.

```php
if ( filter_var( $var_to_check, FILTER_VALIDATE_BOOLEAN ) ) {
    // do true stuff here
} else {
    // do false stuff here
}
```

This will return true for (bool)true, 1, "1", "true", "on" and "yes". Returns false otherwise.

If you need to check for invalid input you can additionally return null if value is not a truthy option above or a falsey value like (bool)false, 0, "0", "false", "off", "no", and ""

@TODO: Check that boolean comparison does work like this 

```php
match ( filter_var( $var_to_check, FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE ) ) {
    true : follow_true_path(),
    false : follow_false_path(),
    default : follow_unknown_path(),
};
```

These are all 

You should not trust that a string boolean will work forever your future self will not like you.

Examples:

* `return ($controlNumberXML->{"IsComplete_On_Followup"} == "true");`
* `return ((string) $value) === "true";`
