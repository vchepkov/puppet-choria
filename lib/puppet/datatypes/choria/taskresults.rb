Puppet::DataTypes.create_type("Choria::TaskResults") do
  interface <<-PUPPET
    attributes => {
      "results" => Array[Choria::TaskResult, 0],
    },
    functions => {
      count => Callable[[], Integer],
      empty => Callable[[], Boolean],
      error_set => Callable[[], Choria::TaskResults],
      find => Callable[[String[1]], Optional[Choria::TaskResult]],
      first => Callable[[], Optional[Choria::TaskResult]],
      ok => Callable[[], Boolean],
      ok_set => Callable[[], Choria::TaskResults],
      hosts => Callable[[], Choria::Nodes],
    }
  PUPPET

  require_relative "../../_load_choria"

  implementation_class MCollective::Util::BoltSupport::TaskResults
end
