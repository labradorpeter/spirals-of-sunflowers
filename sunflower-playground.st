"
Spirals of Sunflower kernels

Peter Graf 08.04.2024 Bavaria

Fibonacci
0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584
            r  l  r  l  r  l  r   l
  
Inspired by
The Algorithmic Beauty Of Plants
Przemyslaw Prusinskiewicz, Aristid Lindenmayer
ISBN-13: 978-0-387-94676-4
"

|numberOfNodes nodes alpha beta canvas win|
"
alpha := 137.3 .
alpha := 137.5 .
alpha := 137.5077641 .
alpha := 137.6 .
"
alpha := 137.5077641 .
numberOfNodes := 300. "300 600 900 1200 1500 1800 2100 8000"
canvas := RSCanvas new.

"Label nodes reversely"
nodes := RSCircle models: (numberOfNodes - 1 to: 0 by: -1).
nodes size: 25.
nodes withBorder.
nodes color: Color white.

"Some spirals starting with 0"
(nodes at: numberOfNodes) color: Color black. "0"
"0, 8, 16, ..."
"1 + 8 to: numberOfNodes by: 8 do: [  :i |
	(nodes at: numberOfNodes - i + 1) color: Color black ]."
"0, 13, 26, ..."
1 + 13 to: numberOfNodes by: 13 do: [  :i |
	(nodes at: numberOfNodes - i + 1) color: Color yellow ].
"0, 21, 42, ..."
1 + 21 to: numberOfNodes by: 21 do: [  :i |
	(nodes at: numberOfNodes - i + 1) color: Color cyan ].
1 + 34 to: numberOfNodes by: 34 do: [  :i |
	(nodes at: numberOfNodes - i + 1) color: Color green ].
1 + 55 to: numberOfNodes by: 55 do: [  :i |
	(nodes at: numberOfNodes - i + 1) color: Color magenta ].
1 + 89 to: numberOfNodes by: 89 do: [  :i |
	(nodes at: numberOfNodes - i + 1) color: Color red ].
1 + 144 to: numberOfNodes by: 144 do: [  :i |
	(nodes at: numberOfNodes - i + 1) color: Color blue ].
1 + 233 to: numberOfNodes by: 233 do: [  :i |
	(nodes at: numberOfNodes - i + 1) color: Color gray ].

(nodes at: 1) translateTo: 0@0.
beta := 90.
numberOfNodes to: 2 by: -1 do: [ :i |
	(nodes at: i)
		translateTo: (
			((300.0 * i) sqrt @ 0)
				rotateBy: beta degreesToRadians
				about: 0 @ 0).
	beta := beta + alpha ].
nodes @ RSLabeled middle.

(canvas add: (
	RSLabel new text: (alpha asString, '°');
	translateTopLeftTo: 50@50;
	fontSize: 16)) setAsFixed.
(canvas add: (
	RSLabel new text: numberOfNodes asString;
	translateTopLeftTo: 50@75;
	fontSize: 16)) setAsFixed.

canvas addAll: nodes.
canvas @ RSCanvasController.
win := canvas open.
win extent: 800 @ 800.
