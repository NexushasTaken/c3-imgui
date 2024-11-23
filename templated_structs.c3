module imgui::vector(<Type>);
import std::collections::list;

// ImVector
struct Vector {
	int size;
	int capacity;
	Type* data;
}

fn Type[] Vector.list(&this) {
  return this.data[:this.size];
}
