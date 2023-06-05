---
tags: ImageMagick GhostScript
resources:
  - https://stackoverflow.com/questions/52998331/imagemagick-security-policy-pdf-blocking-conversion
  - https://www.kb.cert.org/vuls/id/332928/
---

Issue combining pdf files using imagemagick

Sample command and error message

```bash
steve:~ $ convert ~/Desktop/cover-letter.pdf ~/Desktop/resume.pdf ~/Desktop/putala-steve-resume.pdf
convert-im6.q16: attempt to perform an operation not allowed by the security policy `PDF' @ error/constitute.c/IsCoderAuthorized/408.
convert-im6.q16: no images defined `/home/steve/Desktop/putala-steve-resume.pdf' @ error/convert.c/ConvertImageCommand/3258.
```

Remove the xml from the config to get it to work, restore if this is used in an environment where you cannot trust input or if you are running version < 9.24.

```bash
steve:~ $ gs --version
```

Edit the file /etc/ImageMagick/policy.xml (In my case /etc/ImageMagick-6/policy.xml) and comment out the lines

```xml
<!-- disable ghostscript format types -->
<!-- comment these out since conversion is only done on my safe local PDFs and my GhostScript version is > 9.24
<policy domain="coder" rights="none" pattern="PS" />
<policy domain="coder" rights="none" pattern="PS2" />
<policy domain="coder" rights="none" pattern="PS3" />
<policy domain="coder" rights="none" pattern="EPS" />
<policy domain="coder" rights="none" pattern="PDF" />
<policy domain="coder" rights="none" pattern="XPS" />
-->
```

Ultimately that made the pdfs into a low quality image so I instead used GhostScript directly

```bash
steve:~ $ gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dAutoRotatePages=/None -sOutputFile=putala-steve-resume.pdf  ~/Desktop/cover-letter.pdf ~/Desktop/resume.pdf
```

