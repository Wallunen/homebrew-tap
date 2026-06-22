class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260622-033941"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8e8e619291bc0b3f179af79f239109681df77da8c57e69e74dbdd743c8b985b5"
    sha256 cellar: :any_skip_relocation, sequoia:      "e01b698d663bffac1beb4126259fdcb068f7ffb110a91ba295778d9d9604fda1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0de861bf0f0e090eb4805fbe265ead4781ef2283d44be14d65444c4b6b89d19f"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bbca87f79379e4b6431452870701524fd4020d92f91c62a46eeabd9eb592f720" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "28394dc7436b22686c883446f992fb51daa35f307fa59b0d1ec6195f47157c12" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5ee10a5d9d7e3ac6f9edbb25e51b00c0912a9faa4c55b2455b2a24ac8635e6cf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.947+36069a2a7.tar.xz"
  version "0.17.0-dev.947+36069a2a7"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
