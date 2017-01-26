<%@page import="java.io.OutputStream"%>
<%@page import="org.jrimum.bopepo.view.BoletoViewer"%>
<%
BoletoViewer boletoViewer = (BoletoViewer)session.getAttribute("boleto");

byte[] pdfAsBytes = boletoViewer.getPdfAsByteArray();

response.setContentType("application/pdf");
response.setHeader("Content-Disposition", "attachment; filename=boleto.pdf");

OutputStream output = response.getOutputStream();
output.write(pdfAsBytes);

response.flushBuffer();

session.removeAttribute("boleto");
%>
