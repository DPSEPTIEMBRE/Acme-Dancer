<acme:acme_view entity="${style}" skip_fields="courses,videos,pictures">
 <tr>
  <td><spring:message code="style.pictures"/></td>
  <td>
   <table class="table">
    <jstl:forEach var="e" items="${style.pictures }">
     <tr>
      <td><img src="${e }" style="max-width: 120px;max-height: 120px;"></td>
     </tr>
    </jstl:forEach>
   </table>
  </td>
 </tr>
 <tr>
  <td><spring:message code="style.videos"/></td>
  <td>
   <acme:youtube_view url="${style.videos }"></acme:youtube_view>
  </td>
 </tr>
</acme:acme_view>