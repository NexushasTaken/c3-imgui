module imgui;

module imgui::vector(<Type>);
// ImVector
struct Vector {
	int size;
	int capacity;
	Type* data;
}

