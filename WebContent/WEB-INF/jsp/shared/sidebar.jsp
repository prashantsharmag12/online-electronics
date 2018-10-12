
<div class="list-group">

	<div style="margin:relative;">
	<c:forEach items="${categories}" var="category">

		<div
			style="width: 100px; border: 2px solid gray; background-color: white">
			<a href="${contextRoot}/show/category/${category.id}/products"
				class="list-group-items">${category.name}</a>
		</div>
	</c:forEach>
</div>
</div>

</div>