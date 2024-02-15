from lxml import etree

# Define the TEI namespace URI and create an nsmap (namespace map)
TEI_NAMESPACE_URI = "http://www.tei-c.org/ns/1.0"
NSMAP = {'tei': TEI_NAMESPACE_URI}  # Prefix 'tei' mapped to the TEI namespace URI

def add_text_to_node766(element):
    """Recursively copies and modifies the given element, adding text to Node766."""
    if element.tag == "{%s}Node766" % TEI_NAMESPACE_URI:
        # Clone the Node766 element and add extra text, ensuring to use the TEI namespace
        new_elem = etree.Element("{%s}Node766" % TEI_NAMESPACE_URI, attrib=element.attrib, nsmap=NSMAP)
        new_elem.text = (element.text or "") + " add some text "
        for child in element:
            new_elem.append(add_text_to_node766(child))
        return new_elem
    else:
        # For other elements, clone them without modification, ensuring to use the TEI namespace
        tag_with_namespace = "{%s}%s" % (TEI_NAMESPACE_URI, etree.QName(element).localname)
        new_elem = etree.Element(tag_with_namespace, attrib=element.attrib, nsmap=NSMAP)
        new_elem.text = element.text
        for child in element:
            new_elem.append(add_text_to_node766(child))
        return new_elem

def transform_xml_file(input_file_path, output_file_path):
    """Transforms the XML content of the input file and writes it to the output file."""
    with open(input_file_path, 'rb') as file:
        # Parse the XML, providing the nsmap for the root element
        tree = etree.parse(file)
        root = tree.getroot()

    # Apply the transformation
    new_root = add_text_to_node766(root)

    # Write the transformed XML to the new file, using an XML declaration and UTF-8 encoding
    with open(output_file_path, 'wb') as output_file:
        output_file.write(etree.tostring(new_root, pretty_print=True, xml_declaration=True, encoding='UTF-8'))

# Set the paths for the input and output files
input_file_path = '/home/chrisi/Documents/GitHub/Overhaul-UFBAS/TEI XML/ufbas-tei.xml'
output_file_path = '/home/chrisi/Documents/GitHub/Overhaul-UFBAS/TEI XML/ufbas-tei-output.xml'

# Call the function to perform the transformation and save the output
transform_xml_file(input_file_path, output_file_path)
