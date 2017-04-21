require_relative 'graph'

# O(|V|**2 + |E|).
def dijkstra1(source)
  shortest_paths = {}
  possible_paths = {
    source => { cost: 0, last_edge: nil }
  }

  until possible_paths.empty?

    vertex = possible_paths.min_by do |vertex, path|
      path[:cost]
    end[0]

    shortest_paths[vertex] = possible_paths[vertex]

    possible_paths.delete(vertex)

    vertex.out_edges.each do |edge|
      destination = edge.to_vertex

      next if shortest_paths.key? destination

      extended_path_cost = shortest_paths[vertex][:cost] + edge.cost

      next if possible_paths[destination] &&
        possible_paths[destination][:cost] <= extended_path_cost

      possible_paths[destination] = {
        cost: extended_path_cost,
        last_edge: edge.from_vertex
      }
    end

  end
  shortest_paths
end
