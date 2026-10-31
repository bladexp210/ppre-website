# Languages and screens

Two decisions. They apply to the IPIP-NEO-120 build only. They do not apply to the Understanding Society build.

The website will be trilingual: English, French, and Arabic.

The website must be responsive, adapting to both phone and computer screens. It is the same page on both.

How: a viewport tag sets the width to the device width. The layout is fluid, so the page uses the window width it has, up to a maximum content width. Two CSS breakpoints cover a phone, a tablet or a phone turned sideways, and a computer: 640 pixels and 1024 pixels. At 640 pixels and below, sections stack for a phone held upright. From 641 pixels through 1024 pixels, the layout fits a tablet and a phone flipped to landscape. Above 1024 pixels, the computer layout is used. The switches are CSS media queries. There is no backend. Chart.js is set to follow the width of its box, so the chart resizes with the page. The same breakpoints apply in English, French, and Arabic.

The human stated these decisions on 31 Oct 2026 and set the middle tier for tablets and flipped phones the same day.

Status: accepted. Viewport, fluid layout, breakpoints at 640 and 1024 pixels. Middle tier is tablet and phone landscape. Chart.js follows its box.
