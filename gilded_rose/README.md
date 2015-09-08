# Gilded Rose

1. `gem install bundler`
2. Copy down the `gilded_rose.rb`, `gilded_rose_spec.rb`, and `Gemfile` files in this directory.
3. `bundle install`
4. `rspec gilded_rose_spec.rb`
5. Pass all failing and pending tests. (Details below)

## Details

*Welcome to the Gilded Rose!*

As you know, we are a small inn with a prime location in a prominent city run by
a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach
their sell by date. We have a system in place that updates our inventory for us.
It was developed by a no-nonsense type named Leeroy, who has moved on to new
adventures. Your task is to add the new feature to our system so that we can
begin selling a new category of items.

First an introduction to our system:

- All items have a `sell_in` value which denotes the number of days we have to sell the item
- All items have a `quality` value which denotes how valuable the item is
- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, `quality` degrades twice as fast
- The `quality` of an item is never negative
- "Aged Brie" actually increases in `quality` the older it gets (by the same
  rate that normal items decrease; double after the sell by date)
- The `quality` of an item is never more than 50
- "Sulfuras", being a legendary item, never has to be sold or decreases in
  `quality`
- "Backstage passes", like Aged Brie, increases in `quality` as it's `sell_in`
   value approaches;
  - `quality` increases by 2 when there are 10 days or less
  - `quality` increases by 3 when there are 5 days or less
  - `quality` drops to 0 after the concert

All of these requirements are already coded, with accompanying tests.

### Your task:

We have recently signed a supplier of conjured items. This requires an update to
our system:

- "Conjured" items degrade in `quality` twice as fast as normal items

The specs for this are already implemented, but marked as `pending`. You should
implement this functionality, and remove this `pending` status.

Feel free to make any changes to the `update_quality` method and add any new
code as long as everything still works correctly (all tests pass). However, do
not alter the `Item` class or `Items` property (below the dotted line) as those
belong to the goblin in the corner who will insta-rage and one-shot you as he
doesn't believe in shared code ownership.

*NOTE: Just for clarification, an item can never have its `quality` increase
above 50, however "Sulfuras" is a legendary item and as such its `quality` is 80
and it never alters.*
