module imgui::vector(<Type>);
import std::collections::list;

// ImVector
struct Vector {
	int size;
	int capacity;
	Type* data;
}

/**
 * @require this.len() <= usz.max
 */
fn Vector List(<Type>).to_vec(&this) {
  return { (int)this.size, (int)this.capacity, this.entries };
}

fn List(<Type>) Vector.list(&this, Allocator allocator = allocator::heap()) {
  return { this.size, this.capacity, allocator, this.data };
}
