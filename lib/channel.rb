class Channel
  attr_reader :name, :id, :purpose, :is_archived, :members

  def initialize(name, id, purpose: "", is_archived: 0, members: []  )
    raise ArgumentError if name == nil || name == "" || id == nil || id == ""

    @name = name
    @id = id

    @purpose = :purpose
    @is_archived = :is_archived
    @is_general = :is_archived
    @members = :members
  end
end
