const input = document.getElementById("taskInput");
const button = document.getElementById("addBtn");
const taskList = document.getElementById("taskList");

button.addEventListener("click", function () {
  const task = input.value.trim();

  if (task === "") {
    alert("Please enter a task");
    return;
  }

  const li = document.createElement("li");

  const row = document.createElement("div");
  row.className = "todo-row";

  const span = document.createElement("span");
  span.textContent = task;

  const deleteBtn = document.createElement("button");
  deleteBtn.textContent = "Delete";
  deleteBtn.className = "delete-btn";

  deleteBtn.onclick = function () {
    li.remove();
  };

  row.appendChild(span);
  row.appendChild(deleteBtn);
  li.appendChild(row);
  taskList.appendChild(li);

  input.value = "";
});
