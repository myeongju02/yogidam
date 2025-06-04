<template>
    <div id="webcrumbs">
        <div class="min-h-screen p-6">
            <div class="max-w-7xl mx-auto">
                <header class="mb-8">
                    <div class="flex flex-col md:flex-row justify-between items-center gap-4">
                        <div>
                            <h1 class="text-2xl md:text-3xl font-bold text-gray-800">
                                게시글 수정
                            </h1>
                            <p class="text-gray-500 mt-1">게시글 내용을 수정하세요.</p>
                        </div>
                    </div>
                </header>
                <div class="grid grid-cols-1 gap-6 mb-8">
                    <div
                        class="bg-white rounded-xl p-6 shadow-md border border-gray-100 hover:shadow-lg transition-shadow duration-300">
                        <input type="text" placeholder="제목을 입력하세요" v-model="title"
                            class="w-full text-3xl font-bold mb-4 border-0 focus:outline-none focus:ring-0 placeholder-gray-300" />
                        <div class="flex items-center gap-2 mb-4 pb-2 border-b border-gray-200 overflow-x-auto">
                            <button
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">
                                    format_bold
                                </span>
                            </button>
                            <button
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">
                                    format_italic
                                </span>
                            </button>
                            <button
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">
                                    format_underlined
                                </span>
                            </button>
                            <div class="h-6 w-px bg-gray-200 mx-1"></div>
                            <button class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200">
                                <span class="material-symbols-outlined text-gray-600">
                                    format_list_bulleted
                                </span>
                            </button>
                            <button
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">
                                    format_list_numbered
                                </span>
                            </button>
                            <div class="h-6 w-px bg-gray-200 mx-1"></div>
                            <button
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">
                                    insert_link
                                </span>
                            </button>
                            <button
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">
                                    image
                                </span>
                            </button>
                            <button
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">
                                    attach_file
                                </span>
                            </button>
                            <div class="h-6 w-px bg-gray-200 mx-1"></div>
                            <button
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">
                                    code
                                </span>
                            </button>
                            <button
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">
                                    format_quote
                                </span>
                            </button>
                        </div>
                        <div class="min-h-[400px]">
                            <textarea v-model="content"
                                class="w-full h-full min-h-[400px] resize-none border-0 focus:outline-none focus:ring-0 placeholder-gray-300 transition-all duration-300 hover:placeholder-gray-400 focus:placeholder-transparent"
                                placeholder="본문 내용을 작성하세요"></textarea>
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
                    <div
                        class="lg:col-span-2 bg-white rounded-xl shadow-md border border-gray-100 overflow-hidden hover:shadow-lg transition-all duration-300">
                        <div class="p-6 border-b border-gray-100">
                            <h2 class="text-xl font-semibold mb-4">Add Media</h2>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                                <!-- 기존 이미지 표시 -->
                                <div class="mb-4">
                                    <h3 class="text-lg font-semibold mb-2">기존 이미지</h3>
                                    <div v-if="existingImages.length" class="flex flex-wrap gap-2">
                                        <div v-for="(img, index) in existingImages" :key="img.id || img.url || index"
                                            class="relative">
                                            <img :src="img.url" :alt="img.name || '기존 이미지'"
                                                class="w-20 h-20 object-cover rounded" />
                                            <button @click="removeExistingImage(index)"
                                                class="absolute top-1 right-1 bg-white bg-opacity-80 rounded-full p-1 hover:bg-red-500 hover:text-white"
                                                title="Remove">
                                                <span class="material-symbols-outlined text-base">close</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <!-- 기존 파일 표시 -->
                                <div class="mb-4">
                                    <h3 class="text-lg font-semibold mb-2">기존 파일</h3>
                                    <div v-for="(file, index) in existingFiles" :key="file.id || file.url || index"
                                        class="relative">
                                        <a :href="file.url" :download="file.name || extractFileName(file.url)"
                                            target="_blank" rel="noopener"
                                            class="px-3 py-1 bg-gray-100 rounded hover:bg-gray-200">
                                            {{ file.name || extractFileName(file.url) || `파일 ${index + 1}` }}
                                        </a>
                                        <button @click="removeExistingFile(index)"
                                            class="absolute top-1 right-1 bg-white bg-opacity-80 rounded-full p-1 hover:bg-red-500 hover:text-white"
                                            title="Remove">
                                            <span class="material-symbols-outlined text-base">close</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <!-- 이미지 업로드 입력 필드 -->
                                <div class="border-2 border-dashed border-gray-200 rounded-lg p-8 flex flex-col items-center justify-center hover:border-primary-400 hover:bg-gray-50 transition-all duration-300 cursor-pointer transform hover:scale-[1.02] relative"
                                    @click="() => $refs.imageInput.click()" style="min-height:200px">
                                    <span class="material-symbols-outlined text-4xl text-gray-400 mb-2">image</span>
                                    <p class="text-sm text-gray-500 text-center mb-2">
                                        Drag and drop images<br />
                                        or click to browse
                                    </p>
                                    <input ref="imageInput" type="file" accept="image/*" multiple class="hidden"
                                        @change="onImageChange" />
                                    <div v-if="imagePreviews && imagePreviews.length"
                                        class="flex flex-wrap gap-2 mt-4 justify-center">
                                        <div v-for="(src, idx) in imagePreviews" :key="idx"
                                            class="relative w-20 h-20 rounded overflow-hidden border border-gray-200">
                                            <img :src="src" class="object-cover w-full h-full" />
                                            <button @click.stop="removeImage(idx)"
                                                class="absolute top-1 right-1 bg-white bg-opacity-80 rounded-full p-1 hover:bg-red-500 hover:text-white"
                                                title="Remove">
                                                <span class="material-symbols-outlined text-base">close</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <!-- 파일 업로드 입력 필드 -->
                                <div class="border-2 border-dashed border-gray-200 rounded-lg p-8 flex flex-col items-center justify-center hover:border-primary-400  hover:bg-gray-50 transition-all duration-300 cursor-pointer transform hover:scale-[1.02] relative"
                                    @click="() => $refs.fileInput.click()" style="min-height:200px">
                                    <span
                                        class="material-symbols-outlined text-4xl text-gray-400 mb-2">attach_file</span>
                                    <p class="text-sm text-gray-500 text-center mb-2">
                                        Drag and drop files<br />
                                        or click to browse
                                    </p>
                                    <input ref="fileInput" type="file" multiple class="hidden" @change="onFileChange" />
                                    <ul v-if="files.length" class="mt-4 text-xs text-gray-600">
                                        <li v-for="(file, idx) in files" :key="idx">
                                            {{ file.name }}
                                            <button @click.stop="removeFile(idx)"
                                                class="ml-1 text-red-400 hover:text-red-600" title="Remove">
                                                ×
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div
                        class="bg-white rounded-xl shadow-md border border-gray-100 overflow-hidden hover:shadow-lg transition-all duration-300">
                        <div class="p-6 border-b border-gray-100">
                            <h2 class="text-xl font-semibold mb-4">Post Settings</h2>
                            <div class="space-y-4">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-1">
                                        Category
                                    </label>
                                    <select v-model="category"
                                        class="w-full p-2 border border-gray-200 rounded-lg focus:ring-2 focus:ring-primary-300 focus:border-primary-300 focus:outline-none">
                                        <option value="review" selected>여행후기</option>
                                        <option value="question">질문</option>
                                        <option value="recommend">추천</option>
                                    </select>
                                </div>
                                <div class="pt-4">
                                    <button @click="updatePost"
                                        class="w-full px-4 py-2 rounded-lg bg-primary-500 text-white hover:bg-primary-600 transition-all duration-200 shadow-sm hover:shadow-md transform hover:translate-y-[-2px]">
                                        수정하기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import axios from 'axios'

const route = useRoute()
const router = useRouter()

const title = ref('')
const content = ref('')
const category = ref('')
const images = ref([])
const files = ref([])
const imageInput = ref(null)
const imagePreviews = ref([])
const fileInput = ref(null)
const existingImages = ref([])
const existingFiles = ref([])

// 게시글 정보 불러오기
async function fetchPost(id) {
    try {
        const res = await axios.get(`/api/boards/${id}`)
        title.value = res.data.title
        content.value = res.data.content
        category.value = res.data.category
        existingImages.value = res.data.images || []
        existingFiles.value = res.data.files || []
    } catch (error) {
        alert('게시글 정보 불러오기 실패: ' + error.message)
        router.push('/community')
    }
}

// 라우트 파라미터 변경 감지
watch(
    () => route.params.id,
    (newId) => {
        if (newId) fetchPost(newId)
    },
    { immediate: true }
)

// 이미지 업로드
function onImageChange(e) {
    const selectedFiles = Array.from(e.target.files)
    images.value = selectedFiles
    // 미리보기 생성
    imagePreviews.value = selectedFiles.map(file => URL.createObjectURL(file))
}
// 이미지 삭제
function removeImage(idx) {
    images.value.splice(idx, 1)
    imagePreviews.value.splice(idx, 1)
}
// 파일 업로드
function onFileChange(e) {
    files.value = Array.from(e.target.files)
}
// 파일 삭제
function removeFile(idx) {
    files.value.splice(idx, 1)
}
// 기존 이미지 삭제
async function removeExistingImage(index) {
    try {
        await axios.delete(`/api/boards/${route.params.id}/images/${existingImages.value[index].id}`)
        existingImages.value.splice(index, 1)
    } catch (error) {
        alert('이미지 삭제 실패: ' + error.message)
    }
}

// 기존 파일 삭제
async function removeExistingFile(index) {
    try {
        await axios.delete(`/api/boards/${route.params.id}/files/${existingFiles.value[index].id}`)
        existingFiles.value.splice(index, 1)
    } catch (error) {
        alert('파일 삭제 실패: ' + error.message)
    }
}

function extractFileName(url) {
    if (!url) return '';
    try {
        return decodeURIComponent(url.split('/').pop());
    } catch {
        return url;
    }
}

// 게시글 수정
async function updatePost() {
    if (!confirm('수정하시겠습니까?')) return

    const formData = new FormData()
    formData.append(
        'board',
        new Blob([JSON.stringify({
            id: route.params.id,
            title: title.value,
            content: content.value,
            category: category.value,
            images: existingImages.value,
            files: existingFiles.value
            //추가한 이미지 및 파일도 추가가
        })], { type: 'application/json' })
    )

    images.value.forEach(img => formData.append('images', img))
    files.value.forEach(file => formData.append('files', file))

    try {
        await axios.put(`/api/boards/${route.params.id}`, formData, {
            withCredentials: true
        })
        alert('수정 성공!')
        router.push('/community')
    } catch (error) {
        alert('수정 실패: ' + error.message)
    }
}
</script>
