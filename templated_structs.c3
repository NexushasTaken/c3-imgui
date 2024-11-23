module imgui::vector(<Type>);
import std::collections::list;

// ImVector
struct ImVector {
	int size;
	int capacity;
	Type* data;
}

fn Type[] ImVector.list(&this) {
  return this.data[:this.size];
}
