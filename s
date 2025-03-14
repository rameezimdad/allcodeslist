<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Video Data</title>
  
  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  
  <!-- DataTables CSS -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css">
  
  <!-- Optional: DataTables Tailwind Integration (for better styling) -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.tailwind.min.css">
  
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  
  <!-- DataTables JS -->
  <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/responsive/2.4.1/js/dataTables.responsive.min.js"></script>
  
  <style>
    /* Ensure full-page layout */
    html, body {
      height: 100%;
      margin: 0;
    }
    .container-full {
      height: 100%;
      display: flex;
      flex-direction: column;
    }
    .table-container {
      flex: 1;
      overflow: auto;
    }

    /* Button Styles */
    .btn {
      padding: 0.25rem 0.5rem;
      border-radius: 0.25rem;
      font-weight: bold;
      text-align: center;
      color: white;
      text-decoration: none;
      display: inline-block;
    }
    .btn-watch { background-color: #ff0000; } /* Red */
    .btn-contact { background-color: #f1c40f; color: #333; } /* Yellow */
    .btn-code { background-color: #27ae60; } /* Green */
    .btn-views { background-color: #a9dfbf; color: #333; } /* Light Green */

    /* DataTable header and row colors */
    #videoTable thead th {
      background-color: #1f2937;
      color: white;
    }
    #videoTable tbody tr:hover {
      background-color: #f3f4f6;
    }
  </style>
</head>
<body class="bg-gray-100">
  
  <div class="container-full">
    <header class="text-center py-4 bg-gray-800 text-white">
      <h2 class="text-3xl font-bold">Video Data</h2>
    </header>
    
    <div class="table-container overflow-x-auto">
      <table id="videoTable" class="display nowrap stripe hover" style="width:100%">
        <thead>
          <tr>
            <th>Title</th>
            <th>URL</th>
            <th>Views</th>
            <th>Contact Us</th>
            <th>Code</th>
          </tr>
        </thead>
        <tbody>
          <!-- Data will be populated here -->
        </tbody>
      </table>
    </div>
    
    <footer class="bg-gray-800 text-center py-4 text-white">
      <p>&copy; 2024 Your Company. All rights reserved.</p>
    </footer>
  </div>
  
  <script>
    $(document).ready(function() {
      // Replace with your actual Google Apps Script Web App URL
      const scriptURL = 'https://script.google.com/macros/s/AKfycbx2mkY2x6YZmj8Hecjq5X7hlOUBC6T9HqkTHarrt-_Yzm4PaKwnqRXmpDTCv3ZriLjX/exec';

      // Fetch data from Google Apps Script
      fetch(scriptURL)
        .then(response => response.json())
        .then(data => {
          // Populate table body with fetched data
          data.forEach(video => {
            const message = `Hello! I'm interested in the video titled "${video.title}". Here’s the link: ${video.url}`;

            $('#videoTable tbody').append(`
              <tr>
                <td class="px-4 py-2 font-semibold text-primary">${video.title}</td>
                <td class="px-4 py-2">
                  <a href="${video.url}" target="_blank" class="btn btn-watch">Watch</a>
                </td>
                <td class="px-4 py-2">
                  <span class="btn btn-views">${video.views}</span>
                </td>
                <td class="px-4 py-2">
                  <a href="https://wa.me/923224083545" target="_blank" class="btn btn-contact">Contact Us</a>
                </td>
                <td class="px-4 py-2">
                  <a href="https://wa.me/923224083545?text=${encodeURIComponent(message)}" target="_blank" class="btn btn-code">Code</a>
                </td>
              </tr>
            `);
          });

          // Initialize DataTable with responsive feature
          $('#videoTable').DataTable({
            responsive: true,
            language: {
              search: "Search:",
              lengthMenu: "Show _MENU_ entries",
              info: "Showing _START_ to _END_ of _TOTAL_ entries",
              paginate: {
                previous: "Previous",
                next: "Next"
              }
            }
          });
        })
        .catch(error => console.error('Error fetching data:', error));
    });
  </script>
  
</body>
</html>
