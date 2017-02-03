# todo.txt-graph

*A visualization-plugin for [todo.txt](http://todotxt.com/) – a command line todo application.*  

![Graph Image](https://cloud.githubusercontent.com/assets/1055819/11110492/dd8527fe-88fc-11e5-9957-2e03db505fbd.png)

**todo.txt-graph** displays bar charts showing the number of completed tasks per day.  

As in Jerry Seinfeld’s [don’t break the chain](http://dontbreakthechain.com/what) technique, active days will be colored green and therefore motivate you do be more productive.

## Installation

`cd` into your plugins folder (see [Installing Addons](https://github.com/ginatrapani/todo.txt-cli/wiki/Creating-and-Installing-Add-ons)), e.g.:


```
cd ~/.todo.actions.d
```

Then clone this repository into the folder *graph*:

```
git clone https://github.com/timpulver/todo.txt-graph.git graph
```

The directory structure should look like this now:  

```
~/.todo.actions.d/
    graph/
        graph
        graph.py  
```

## Usage

Visualize last 7 days:  

```
todo.sh graph
```

Visualize last 123 days:  

```
todo.sh graph 123
```

## Threshold

By default, days with less than 5 completed tasks will be considered inactive (and therefore colored grey). You can change the threshold by adding an entry to your `todo.cfg` file:  

```
# Threshold for Graph Addon
export TODOTXT_GRAPH_THRESHOLD=10
```

## Compatibility

Tested with *todo.txt* 2.10 on Mac OS X 10.11.1  

## Credits

Tim Pulver, 2015

Code used from:  

- [termgraph](https://github.com/mkaz/termgraph/blob/master/termgraph.py)
- [lately](https://github.com/emilerl/emilerl/)





