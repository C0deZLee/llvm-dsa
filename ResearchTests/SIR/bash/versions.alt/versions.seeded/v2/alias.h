/* alias.h -- structure definitions. */

/* Copyright (C) 1987,1991 Free Software Foundation, Inc.

   This file is part of GNU Bash, the Bourne Again SHell.

   Bash is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

   Bash is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
   License for more details.

   You should have received a copy of the GNU General Public License
   along with Bash; see the file COPYING.  If not, write to the Free
   Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA. */

#if !defined (_ALIAS_H_)
#define _ALIAS_H_

#include "hashlib.h"

extern char *xmalloc ();

typedef struct alias {
  char *name;
  char *value;
  char flags;
} alias_t;

/* Values for `flags' member of struct alias. */
#define AL_EXPANDNEXT		0x1
#define AL_BEINGEXPANDED	0x2

/* The list of known aliases. */
extern HASH_TABLE *aliases;

extern void initialize_aliases ();

/* Scan the list of aliases looking for one with NAME.  Return NULL
   if the alias doesn't exist, else a pointer to the alias. */
extern alias_t *find_alias ();

/* Return the value of the alias for NAME, or NULL if there is none. */
extern char *get_alias_value ();

/* Make a new alias from NAME and VALUE.  If NAME can be found,
   then replace its value. */
extern void add_alias ();

/* Remove the alias with name NAME from the alias list.  Returns
   the index of the removed alias, or -1 if the alias didn't exist. */
extern int remove_alias ();

/* Remove all aliases. */
extern void delete_all_aliases ();

/* Return a new line, with any aliases expanded. */
extern char *alias_expand ();

/* Return an array of all defined aliases. */
extern alias_t **all_aliases ();

/* Expand a single word for aliases. */
extern char *alias_expand_word ();

#endif /* _ALIAS_H_ */
