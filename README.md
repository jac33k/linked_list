# Linked List basics
These few lines of code show basic implementation of singly (you can move only in one direction) linked list in Ruby.

## What is a Linked List?
That's nothing more than yet another data structure. The only thing you need to have working Linked List is a single 
node that contains any value (number, string, another object) and *reference* to the next node (can be *nil* if given 
node doesn't have any successors). Here's the image from Wikipedia's article about [Linked List](https://en.wikipedia.org/wiki/Linked_list):
<p align="center">
<img src='https://upload.wikimedia.org/wikipedia/commons/6/6d/Singly-linked-list.svg'/>
</p>

## Usage
### Get started
Install gems:
```
$> bundle install
```
Run tests:
```
$> bundle exec rake spec
```
Run console:
```
$> bundle exec rake c
```

### Create Linked List
To create a Linked List go to the console and type in:
```ruby
node1 = LinkedList::Node.new(1)
node2 = LinkedList::Node.new(2, node1)
node3 = LinkedList::Node.new(3, node2)
node4 = LinkedList::Node.new(4, node3)
```
This will create the list containing four nodes with values from 1 to 4. Keep in mind the `node4` is the head of the list!

### Browsing Linked List
After creating the list you can go through it using instance method `next_node` from `LinkedList::Node` class
```ruby
[1] pry(main)> node1 = LinkedList::Node.new(1)
[2] pry(main)> node2 = LinkedList::Node.new(2, node1)
[3] pry(main)> node3 = LinkedList::Node.new(3, node2)
[4] pry(main)> node4 = LinkedList::Node.new(4, node3)
[5] pry(main)> node4.next_node
=> #<LinkedList::Node:0x007f89018fb678 @next_node=#<LinkedList::Node:0x007f8903242bb8 @next_node=#<LinkedList::Node:0x007f8902cf07a0 @next_node=nil, @value=1>, @value=2>, @value=3>
[6] pry(main)> node4.next_node.next_node
=> #<LinkedList::Node:0x007f8903242bb8 @next_node=#<LinkedList::Node:0x007f8902cf07a0 @next_node=nil, @value=1>, @value=2>
[7] pry(main)> node4.next_node.next_node.next_node
=> #<LinkedList::Node:0x007f8902cf07a0 @next_node=nil, @value=1>
[8] pry(main)> node4.next_node.next_node.next_node.next_node
=> nil
```

### Printing reversed Linked List (without mutation)
This Service Object is used to print Linked List in reversed order without using mutation (actual order of nodes doesn't
change):
```ruby
[1] pry(main)> node1 = LinkedList::Node.new(1)
[2] pry(main)> node2 = LinkedList::Node.new(2, node1)
[3] pry(main)> node3 = LinkedList::Node.new(3, node2)
[4] pry(main)> node4 = LinkedList::Node.new(4, node3)
[5] pry(main)> print_reversed = LinkedList::Utils::PrintReversed.new
=> #<LinkedList::Utils::PrintReversed:0x007fccc267ae30 @stack=#<LinkedList::Stack:0x007fccc267ae08 @elements=[]>>
[6] pry(main)> print_reversed.call(node4)
4 --> 3 --> 2 --> 1 --> nil
1 --> 2 --> 3 --> 4 --> nil
=> nil
[7] pry(main)> node4.next_node
=> #<LinkedList::Node:0x007fccc14efb48 @next_node=#<LinkedList::Node:0x007fccc25f97e0 @next_node=#<LinkedList::Node:0x007fccc21f0f40 @next_node=nil, @value=1>, @value=2>, @value=3>
```

### Reversing the order of the Linked List
The output of this Service Object is exactly the same (prints reversed list), but it changes actual order of the list (using mutation):
```ruby
[1] pry(main)> node1 = LinkedList::Node.new(1)
[2] pry(main)> node2 = LinkedList::Node.new(2, node1)
[3] pry(main)> node3 = LinkedList::Node.new(3, node2)
[4] pry(main)> node4 = LinkedList::Node.new(4, node3)
[5] pry(main)> reverse_list = LinkedList::Utils::Reverse.new
=> #<LinkedList::Utils::Reverse:0x007ff0844778f0>
[6] pry(main)> reverse_list.call(node4)
4 --> 3 --> 2 --> 1 --> nil
1 --> 2 --> 3 --> 4 --> nil
=> nil
[7] pry(main)> node4.next_node
=> nil
[8] pry(main)> node1.next_node
=> #<LinkedList::Node:0x007ff08442eee8 @next_node=#<LinkedList::Node:0x007ff085040150 @next_node=#<LinkedList::Node:0x007ff0860f5ce8 @next_node=nil, @value=4>, @value=3>, @value=2>
```
In this example we can notice that `node4` doesn't have any successor (returns `nil`) and node1 became the head of the list (the `value` of its successor equal 2).

### Floyd's cycle detection algorithm
Sometimes the Linked List can have cycles (one of the nodes references to already visited node). 
The [cycle detection](https://en.wikipedia.org/wiki/Cycle_detection) problem is better described in Wikipedia article.
<br/>
The `LinkedList::Utils::FloydsCheck` service object returns `true` when it finds the cycle and `false` when Linked list doesn't have any.
Find the example for the list without cycles below:
```ruby
[1] pry(main)> node1 = LinkedList::Node.new(1)
[2] pry(main)> node2 = LinkedList::Node.new(2, node1)
[3] pry(main)> node3 = LinkedList::Node.new(3, node2)
[4] pry(main)> node4 = LinkedList::Node.new(4, node3)
[5] pry(main)> floyds_check = LinkedList::Utils::FloydsCheck.new
=> #<LinkedList::Utils::FloydsCheck:0x007fd9e37bda58>
[6] pry(main)> floyds_check.call(node4)
=> false
```
Let's create the cycle in our Linked List now:
```ruby
[1] pry(main)> node1 = LinkedList::Node.new(1)
[2] pry(main)> node2 = LinkedList::Node.new(2, node1)
[3] pry(main)> node3 = LinkedList::Node.new(3, node2)
[4] pry(main)> node4 = LinkedList::Node.new(4, node3)
[5] pry(main)> floyds_check = LinkedList::Utils::FloydsCheck.new
=> #<LinkedList::Utils::FloydsCheck:0x007fd9e37bda58>
[6] pry(main)> node2.next_node = node4
=> #<LinkedList::Node:0x007fdd13153158
 @next_node=#<LinkedList::Node:0x007fdd126bf8e0 @next_node=#<LinkedList::Node:0x007fdd119357d8 @next_node=#<LinkedList::Node:0x007fdd13153158 ...>, @value=2>, @value=3>,
 @value=4>
 [7] pry(main)> floyds_check.call(node4)
=> true
```

I hope you liked it!
