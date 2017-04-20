require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# Kahn's Algorithm
def topological_sort(vertices)
  sorted = []
  queue = []
  in_edge_counts = {}

  vertices.each do |vertex|
    in_edge_counts[vertex] = vertex.in_edges.count
    queue << vertex if vertex.in_edges.empty?
  end

  until queue.empty?
    current = queue.shift
    sorted << current

    current.out_edges.each do |edge|
      destination = edge.to_vertex
      in_edge_counts[destination] -= 1
      queue << destination if in_edge_counts[destination] == 0
    end
  end
  sorted
end

# Tarjan's Algorithm
