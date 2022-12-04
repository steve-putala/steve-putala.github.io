---
tags:
  - mysql
  - reference
  - error message
title: "How to fix ERROR 1205 (HY000): Lock wait timeout exceeded; try restarting transaction"
---

The commands to unlock stuck mysql tables.

## List locked tables

```sql
show open tables where in_use > 0;
```

## List current processes

```sql
show processlist;
```

## Kill process

phpMyAdmin has a link to click to kill the process, otherwise replace [PROCESS_ID] in the command below:

```sql
kill [PROCESS_ID];
```