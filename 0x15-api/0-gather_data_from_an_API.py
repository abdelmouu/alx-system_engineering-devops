#!/usr/bin/python3
"""
A Script that, using this REST API, for a given employee ID, returns
information about his/her TODO list progress
"""
import requests
from sys import argv

if __name__ == "__main__":
    if len(argv) != 2:
        print("Usage: ./0-gather_data_from_an_API.py <employee_id>")
        exit(1)

    employee_id = argv[1]
    url = f"https://jsonplaceholder.typicode.com/users/{employee_id}"
    response = requests.get(url)

    if response.status_code == 200:
        employee_data = response.json()
        employee_name = employee_data["name"]

        todos_url = f"https://jsonplaceholder.typicode.com/users/{employee_id}/todos"
        todos_response = requests.get(todos_url)

        if todos_response.status_code == 200:
            todos = todos_response.json()
            total_tasks = len(todos)
            done_tasks = sum(1 for task in todos if task["completed"])

            print(f"Employee {employee_name} is done with tasks({done_tasks}/{total_tasks}):")
            for task in todos:
                if task["completed"]:
                    print(f"\t {task['title']}")
        else:
            print("Failed to retrieve TODO list.")
    else:
        print("Failed to retrieve employee data.")
