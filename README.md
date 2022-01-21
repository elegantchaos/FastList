# FastList

A fast but very bare-bones replacement for SwiftUI's List.

This is intended to work-around some of List's problems, especially with regard to large lists, which suffer terribly from SwiftUI's attempts to animate updates in a "clever" way :(.

It is intended as a drop-in replacement, but right now it doesn't even pretend to do 90% of what List does - it just does what I need it to do in the project(s) I wrote it for.

I will expand it as I need other features, and I'm open to pull-requests which add (for example), support for other list styles, as long as they don't break performance. 
