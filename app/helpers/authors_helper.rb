module AuthorsHelper
	def all_authors(authors)
		if authors.present?
			authors.map(&:full_name).join(', ')
		else
			"-"
		end
	end
end
