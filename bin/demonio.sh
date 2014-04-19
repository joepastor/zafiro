#!/bin/bash
proceso="/zafiro/zafiro.py"
pid=`ps auxw | grep $proceso | grep -v grep`
if [ -z "$pid" ]; then
	echo "Zafiro caido. Levantando..."
	/zafiro/zafiro.py &
else
	echo "El ZAFIRO esta levantado"
fi

