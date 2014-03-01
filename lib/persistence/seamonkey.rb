require 'rom'

class Seamonkey
  NAMESPACE = :seamonkeys

  attr_accessor :id, :name, :type, :phase

  def initialize(attributes)
    attributes.each { |name, value| send("#{name}=", value) }
  end

  #seamonkey = session[NAMESPACE].restrict(name: 'Jane').sort_by(:name).one
  #seamonkey_table = rom[:seamonkeys]
  #if id
  #  seamonkey_table.insert(self)
  #else
  #  seamonkey_table.insert(self)
  #end

  # Session argument for chaining calls in a session
  def save!(session = nil)
    if session
      _save(session)
    else
      rom.session do |session|
        _save(session)
      end
    end
  end

  def destroy!(session = nil)
    if session
      _delete(session)
    else
      rom.session do |session|
        _delete(session)
      end
    end
  end

  private

  def _save(session)
    namespace = session[NAMESPACE]
    return unless namespace.dirty?(self)
    namespace.save(self)
    session.flush
  end

  def _delete(session)
    session[NAMESPACE].save(self)
    session.flush
  end

end


# Namespace mapping
rom.mapping do
  seamonkeys do
    model Seamonkey
    map :id, :name, :type, :phase
  end
end