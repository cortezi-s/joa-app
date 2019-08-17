class Document < ApplicationRecord
	has_one_attached :file
	validates :file, attached: true, size: { less_than: 100.megabytes }, content_type: [
		"text/plain", # .txt
		"text/csv", # .csv
		"text/html", # .html
		"application/xhtml+xml", # .xhtml
		"application/xml", # .xml
		"application/pdf", # .pdf
		"application/msword", # .doc
		"application/vnd.openxmlformats-officedocument.wordprocessingml.document", # .docx
		"application/vnd.ms-powerpoint", # .ppt
		"application/vnd.ms-excel", # .xls, .xlsx
		"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", # .xls, .xlsx
		"application/rtf", # .rtf
		"application/vnd.visio" # .vsd
	]

	def as_json(*)
		super.except("created_at", "updated_at").tap do |hash|
			hash["file"] = { name: file.blob.filename.to_s }
		end
	end
end
