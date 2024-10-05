-- Superclass for all windows

local awful = require("awful")
local gears = require("gears")

local window = {}

local ROMAN_NUMERAL_LIST = {"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"}

-- Constructor
function window:new(o, window_name, initial_tag_count, default_tag_layout)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   
   o.window_name = window_name
   o.screen = awful.screen.focused()
   o.taglist = {}
   -- last_seleted refers to most recent, not necessarily previous
   o.last_selected_tag = nil
   o.last_selected_tag_index = nil
   o.tagcount = 0
   o.default_tag_layout = default_tag_layout
   o.initial_tag_count = initial_tag_count
      
   return o
end

function window:remove_tag(tag)
   if self.tagcount == 1 then return end
   
   index = 1
   tag_index = 0
   state = 0 -- Used to track whether the tag has been found
   -- Once it is found, the next tags are renamed to order nicely
   for _, t in pairs(self.taglist) do
      if state == 1 then
	 t.name = ROMAN_NUMERAL_LIST[index - 1]
      elseif t == tag then
	 state = 1
	 tag_index = index
      end
      index = index + 1
   end

   -- Deal with all the variables that now need to be changed
   if state == 1 then
      table.remove(self.taglist, tag_index)
      self.tagcount = self.tagcount - 1
      tag:delete()
      if self:contains_tag(awful.screen.focused().selected_tag) then
	 self.last_selected_tag = awful.screen.focused().selected_tag
	 self.last_selected_tag_index = self:get_tag_index(self.last_selected_tag)
      else
	 self.last_selected_tag = self.taglist[1]
	 self.last_selected_tag_index = 1
      end
   end
   return
end

-- Create a new tag and increment tagcount
function window:add_tag()
   self.tagcount = self.tagcount + 1
   local new_tag = awful.tag.add(ROMAN_NUMERAL_LIST[self.tagcount], {
				    screen = self.screen,
				    layout = self.default_tag_layout})
   table.insert(self.taglist, new_tag)
   return new_tag
end

-- Used to initialize tags
function window:create_tags()
   for i=1,self.initial_tag_count do
      self:add_tag(s)
   end
   -- Initialize the first tag in the list as the first selected one
   self.last_selected_tag_index = 1
   self.last_selected_tag = self.taglist[1]
end

-- Get tag index
function window:get_tag_index(tag)
   index = 1
   for _, t in pairs(self.taglist) do
      if t == tag then
	 return index
      end
      index = index + 1
   end
   return nil
end

-- Check if tag is within a window
function window:contains_tag(tag)
   for _, t in pairs(self.taglist) do
      if t == tag then
	 return true
      end
   end
   return false
end

-- Switch to the tag with the given index in taglist
function window:switch_tag_by_index(index)
   -- Check if tag exists at index, then make relevant shifts
   if self.taglist[index] then
      self.last_selected_tag_index = index
      self.last_selected_tag = self.taglist[index]
      self.taglist[index]:view_only()
   end
end

-- Toggle the tag with the given index in taglist
function window:toggleswitch_tag_by_index(index)
   if self.taglist[index] then
      self.last_selected_tag_index = index
      self.last_selected_tag = self.taglist[index]
      self.taglist[index]:viewtoggle()
   end
end

-- Shift to tag by a given step size
function window:step_to_other_tag(step)
   new_position = (self.last_selected_tag_index + step) % self.tagcount
   if (new_position == 0) then
      new_position = self.tagcount
   end
   self:switch_tag_by_index(new_position)
end

-- Function for determining whether a tag should be in the taglist
function window:taglist_filter(tag)
   return self:contains_tag(tag)
end

function window:post_init()
end

function window:establish_keybinds()
end


return window

