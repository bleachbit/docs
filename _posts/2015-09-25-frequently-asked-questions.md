---
layout: page
title: "Frequently Asked Questions"
category: doc
date: 2000-01-25 23:30:16
order: 5
---

{% for faq in site.data.faqs.main %}
## Q: {{ faq.question }}

A: {{ faq.answer }}

{% endfor %}

## Things to know

While these may not be asked, they are not common knowledge:

{% for faq in site.data.faqs.things_to_know %}
## Q: {{ faq.question }}

A: {{ faq.answer }}

{% endfor %}

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
{% for faq in site.data.faqs.main %}
    {
      "@type": "Question",
      "name": {{ faq.question | jsonify }},
      "acceptedAnswer": {
        "@type": "Answer",
        "text": {{ faq.answer | markdownify | jsonify }}
      }
    }{% if forloop.last == false %},{% else %}{% if site.data.faqs.things_to_know.size > 0 %},{% endif %}{% endif %}
{% endfor %}
{% for faq in site.data.faqs.things_to_know %}
    {
      "@type": "Question",
      "name": {{ faq.question | jsonify }},
      "acceptedAnswer": {
        "@type": "Answer",
        "text": {{ faq.answer | markdownify | jsonify }}
      }
    }{% if forloop.last == false %},{% endif %}
{% endfor %}
  ]
}
</script>
