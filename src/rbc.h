/*
 * This file is a part of RBC Combine.
 *
 * Copyright (c) 2017 Luke Gallagher <luke.gallagher@rmit.edu.au>
 *
 * For the full copyright and license information, please view the LICENSE file
 * that was distributed with this source code.
 */

#ifndef RBC_H
#define RBC_H

#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "pq.h"
#include "rbc_topic.h"
#include "trec.h"

void
rbc_weight_alloc(const double phi, const size_t len);

void
rbc_init(const struct trec_topic *topics);

void
rbc_destory();

void
rbc_accumulate(struct trec_run *r);

void
rbc_present(FILE *stream, const char *id, size_t depth);

#endif /* RBC_H */
