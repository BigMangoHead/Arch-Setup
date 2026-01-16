-- from ChatGPT

row_manager = {}

function row_manager.add_row(ods_file, row_data)
    -- Create a temp directory
    local tmpdir = os.tmpname()
    os.remove(tmpdir)
    os.execute("mkdir " .. tmpdir)

    -- Unzip ODS
    os.execute(string.format("unzip -q %s -d %s", ods_file, tmpdir))

    -- Read content.xml
    local content_path = tmpdir .. "/content.xml"
    local f = assert(io.open(content_path, "r"))
    local content = f:read("*all")
    f:close()

    -- Build a table row
    local row = "        <table:table-row>\n"
    for _, v in ipairs(row_data) do
        row = row .. string.format([[
        <table:table-cell office:value-type="string"><text:p>%s</text:p></table:table-cell>
        ]], v)
    end
    row = row .. "        </table:table-row>\n"

    -- Insert before closing table tag of first sheet
    local new_content, n = content:gsub(
        "(</table:table>)",
        row .. "%1",
        1
    )

    if n == 0 then
        error("Failed to insert row (table tag not found)")
    end

    -- Write back content.xml
    f = assert(io.open(content_path, "w"))
    f:write(new_content)
    f:close()

    -- Repack ODS
    os.execute(string.format(
        "cd %s && zip -qr %s *",
        tmpdir, ods_file
    ))

end

return row_manager
