# luahaystack
The goal of this project is to have a relatively feature complete Haystack implementation for Lua (specifically Luvit, but it _should_ be relatively easy to port to other Lua-based systems. Theoretically, you'd "just" need to reimplement the networking and luvit's object system `core.Object`)

# Implemented/To-be-implemented datatypes
Currently, I do not aim to implement every datatype in the Haystack standard. Here's what I currently am planning on implementing, with a checked box meaning it's done:
- [ ] Grids
- [ ] Lists
- [ ] Dicts
- [x] nulls 
- [x] Bools
- [x] Markers
- [x] Removes
- [x] NAs
- [x] Numbers
- [ ] Refs
- [ ] Strs
- [ ] Uris
- [ ] Coords
- [ ] XStrs

Basically, I aim to implement everything _except_ Date, Time, and DateTime.