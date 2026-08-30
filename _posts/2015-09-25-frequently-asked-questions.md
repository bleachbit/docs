---
layout: page
title: "Frequently asked questions"
nav_title: "FAQ"
category: doc
date: 2015-09-25 23:30:16
order: 5
---

{% assign main_faqs = site.data.faqs.main %}
{% include faqs.html faqs=main_faqs heading="Frequently Asked Questions" %}

## Things to know

While these may not be asked, they are not common knowledge:

{% assign extra_faqs = site.data.faqs.things_to_know %}
{% include faqs.html faqs=extra_faqs heading=false %}
