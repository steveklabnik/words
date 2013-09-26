# Words

A super simple publishing system. I assume you like standard UNIX tools. And
Markdown. And Amazon S3.

Basically, you write some markdown files, and run `make ship`. In return, you
have some HTML (and optionally an epub/mobi/pdf) on S3. You can then point a
domain at it.

Simple is good.

## Getting Started.

Check if you've got what it needs:

```bash
$ make check
```

It will tell you what you need installed, and error out if hard requirements
can't be found.

Next, build:

```bash
$ make
```

Done! It's that easy.

### License

Words is released as Free Software under the AGPLv3. See LICENSE for more
details. If that's scary to you, it means that if you modify this code, and
share it with others, you have to give them the code, too.

Of course, that's my code, not your writing. You can do whatever you want with
that.
